/*
  This file is for implementating the inversion-free Berlekamp-Massey algorithm
  see https://ieeexplore.ieee.org/document/87857

  For the implementation strategy, see
  https://eprint.iacr.org/2017/793.pdf
*/

#include "bm.h"

#include "gf.h"

extern gf vec_reduce_asm(vec128 *);
extern void update_asm(vec128 *, gf);

static inline uint16_t mask_nonzero(gf a) {
  uint32_t ret = a;

  ret -= 1;
  ret >>= 31;
  ret -= 1;

  return ret;
}

static inline uint16_t mask_leq(uint16_t a, uint16_t b) {
  uint32_t a_tmp = a;
  uint32_t b_tmp = b;
  uint32_t ret = b_tmp - a_tmp;

  ret >>= 31;
  ret -= 1;

  return ret;
}

static inline void vec128_cmov(vec128 *out, vec128 *in, uint16_t mask) {
  int i;

  vec128 v0, v1;

  vec128 m0 = vec128_set1_16b(mask);
  vec128 m1 = vec128_set1_16b(~mask);

  for (i = 0; i < GFBITS; i++) {
    v0 = vec128_and(in[i], m0);
    v1 = vec128_and(out[i], m1);
    out[i] = vec128_or(v0, v1);
  }
}

static inline void interleave(vec128 *in, int idx0, int idx1, vec128 *mask,
                              int b) {
  int s = 1 << b;

  vec128 x, y;

  x = vec128_or(vec128_and(in[idx0], mask[0]),
                vec128_sll_2x(vec128_and(in[idx1], mask[0]), s));

  y = vec128_or(vec128_srl_2x(vec128_and(in[idx0], mask[1]), s),
                vec128_and(in[idx1], mask[1]));

  in[idx0] = x;
  in[idx1] = y;
}

/* input: in, field elements in bitsliced form */
/* output: out, field elements in non-bitsliced form */
static inline void get_coefs(gf *out, vec128 *in) {
  int i, k;

  vec128 mask[4][2];
  vec128 buf[16];

  for (i = 0; i < 13; i++)
    buf[i] = in[i];
  for (i = 13; i < 16; i++)
    buf[i] = vec128_setzero();

  mask[0][0] = vec128_set1_16b(0x5555);
  mask[0][1] = vec128_set1_16b(0xAAAA);
  mask[1][0] = vec128_set1_16b(0x3333);
  mask[1][1] = vec128_set1_16b(0xCCCC);
  mask[2][0] = vec128_set1_16b(0x0F0F);
  mask[2][1] = vec128_set1_16b(0xF0F0);
  mask[3][0] = vec128_set1_16b(0x00FF);
  mask[3][1] = vec128_set1_16b(0xFF00);

  interleave(buf, 0, 8, mask[3], 3);
  interleave(buf, 1, 9, mask[3], 3);
  interleave(buf, 2, 10, mask[3], 3);
  interleave(buf, 3, 11, mask[3], 3);
  interleave(buf, 4, 12, mask[3], 3);
  interleave(buf, 5, 13, mask[3], 3);
  interleave(buf, 6, 14, mask[3], 3);
  interleave(buf, 7, 15, mask[3], 3);

  interleave(buf, 0, 4, mask[2], 2);
  interleave(buf, 1, 5, mask[2], 2);
  interleave(buf, 2, 6, mask[2], 2);
  interleave(buf, 3, 7, mask[2], 2);
  interleave(buf, 8, 12, mask[2], 2);
  interleave(buf, 9, 13, mask[2], 2);
  interleave(buf, 10, 14, mask[2], 2);
  interleave(buf, 11, 15, mask[2], 2);

  interleave(buf, 0, 2, mask[1], 1);
  interleave(buf, 1, 3, mask[1], 1);
  interleave(buf, 4, 6, mask[1], 1);
  interleave(buf, 5, 7, mask[1], 1);
  interleave(buf, 8, 10, mask[1], 1);
  interleave(buf, 9, 11, mask[1], 1);
  interleave(buf, 12, 14, mask[1], 1);
  interleave(buf, 13, 15, mask[1], 1);

  interleave(buf, 0, 1, mask[0], 0);
  interleave(buf, 2, 3, mask[0], 0);
  interleave(buf, 4, 5, mask[0], 0);
  interleave(buf, 6, 7, mask[0], 0);
  interleave(buf, 8, 9, mask[0], 0);
  interleave(buf, 10, 11, mask[0], 0);
  interleave(buf, 12, 13, mask[0], 0);
  interleave(buf, 14, 15, mask[0], 0);

  for (i = 0; i < 16; i++)
    for (k = 0; k < 4; k++) {
      out[(4 * 0 + k) * 16 + i] =
          (vec128_extract(buf[i], 0) >> (k * 16)) & GFMASK;
      out[(4 * 1 + k) * 16 + i] =
          (vec128_extract(buf[i], 1) >> (k * 16)) & GFMASK;
    }
}

/* input: in, sequence of field elements */
/* output: out, minimal polynomial of in */
void bm(vec128 *out, vec128 in[][GFBITS]) {
  int i;
  uint16_t N, L;
  uint16_t mask;
  uint64_t one = 1, t;

  vec128 prod[GFBITS];
  vec128 interval[GFBITS];
  vec128 dd[GFBITS], bb[GFBITS];
  vec128 B[GFBITS], C[GFBITS];
  vec128 B_tmp[GFBITS], C_tmp[GFBITS];

  gf d, b, c0 = 1;
  gf coefs[256];

  // initialization

  get_coefs(&coefs[0], in[0]);
  get_coefs(&coefs[128], in[1]);

  C[0] = vec128_setzero();
  B[0] = vec128_set2x(0, one << 63);

  for (i = 1; i < GFBITS; i++)
    C[i] = B[i] = vec128_setzero();

  b = 1;
  L = 0;

  //

  for (i = 0; i < GFBITS; i++)
    interval[i] = vec128_setzero();

  for (N = 0; N < 256; N++) {
    vec128_mul(prod, C, (vec128 *)interval);
    update_asm(interval, coefs[N]);
    d = vec_reduce_asm(prod);

    t = gf_mul2(c0, coefs[N], b);
    d ^= t & 0xFFFFFFFF;

    mask = mask_nonzero(d) & mask_leq(L * 2, N);

    for (i = 0; i < GFBITS; i++) {
      dd[i] = vec128_setbits((d >> i) & 1);
      bb[i] = vec128_setbits((b >> i) & 1);
    }

    vec128_mul(B_tmp, dd, B);
    vec128_mul(C_tmp, bb, C);

    vec128_cmov(B, C, mask);
    update_asm(B, c0 & mask);

    for (i = 0; i < GFBITS; i++)
      C[i] = vec128_xor(B_tmp[i], C_tmp[i]);

    c0 = t >> 32;
    b = (d & mask) | (b & ~mask);
    L = ((N + 1 - L) & mask) | (L & ~mask);
  }

  c0 = gf_inv(c0);

  for (i = 0; i < GFBITS; i++)
    out[i] = vec128_setbits((c0 >> i) & 1);

  vec128_mul(out, out, C);
}
