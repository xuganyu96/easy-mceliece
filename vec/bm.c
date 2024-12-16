/**
 * Attempt at unuifying the implementations of routines in bm.c
 */
#include "gf.h"
#include "vec.h"

/**
 * Only used in mceliece348864(f) using GF(2^12)
 *
 * Returns an all-one mask if the input is 0; else return an all-zero mask
 */
static inline uint64_t mask_nonzero_gf12(gf a) {
  uint64_t ret = a;
  ret -= 1;
  ret >>= 63;
  ret -= 1;
  return ret;
}

/**
 * Used in mcelice460896(f)/668812(f)/6960119(f)/8192128(f) using GF(2^13)
 *
 * Returns an all-one mask if the input is 0; else return an all-zero mask
 */
static inline uint16_t mask_nonzero_gf13(gf a) {
  uint32_t ret = a;

  ret -= 1;
  ret >>= 31;
  ret -= 1;

  return ret;
}

/**
 * Return an all-one mask if a <= b, else return an all-one mask
 */
static inline uint16_t mask_leq(uint16_t a, uint16_t b) {
  uint32_t a_tmp = a;
  uint32_t b_tmp = b;
  uint32_t ret = b_tmp - a_tmp;

  ret >>= 31;
  ret -= 1;

  return ret;
}

static inline void vec_cmov(vec *out, vec *in, uint16_t mask) {
  int i;

  vec m0, m1;

  m0 = vec_set1_16b(mask);
  m1 = ~m0;

  for (i = 0; i < GFBITS; i++) {
    out[i] = (in[i] & m0) | (out[i] & m1);
    out[i] = (in[i] & m0) | (out[i] & m1);
  }
}

static inline void interleave(vec *in, int idx0, int idx1, vec *mask, int b) {
  int s = 1 << b;

  vec x, y;

  x = (in[idx0] & mask[0]) | ((in[idx1] & mask[0]) << s);
  y = ((in[idx0] & mask[1]) >> s) | (in[idx1] & mask[1]);

  in[idx0] = x;
  in[idx1] = y;
}

static inline void get_coefs(gf *out, vec *in) {
  int i, k;

  vec mask[4][2];
  vec buf[16];

  for (i = 0; i < GFBITS; i++)
    buf[i] = in[i];
  for (i = GFBITS; i < 16; i++)
    buf[i] = 0;

  mask[0][0] = vec_set1_16b(0x5555);
  mask[0][1] = vec_set1_16b(0xAAAA);
  mask[1][0] = vec_set1_16b(0x3333);
  mask[1][1] = vec_set1_16b(0xCCCC);
  mask[2][0] = vec_set1_16b(0x0F0F);
  mask[2][1] = vec_set1_16b(0xF0F0);
  mask[3][0] = vec_set1_16b(0x00FF);
  mask[3][1] = vec_set1_16b(0xFF00);

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
    for (k = 0; k < 4; k++)
      out[k * 16 + i] = (buf[i] >> (k * 16)) & GFMASK;
}

// Used in mceliece3488 with GF(2^12)
static void update_gf12(vec *in, const gf e) {
  int i;
  vec tmp;

  for (i = 0; i < GFBITS; i++) {
    tmp = (e >> i) & 1;

    in[i] = (in[i] >> 1) | (tmp << 63);
  }
}

// used in mcelice460896 and above with GF(2^13)
static void update_gf13(vec in[][GFBITS], const gf e) {
  int i;
  vec tmp;

  for (i = 0; i < GFBITS; i++) {
    tmp = (e >> i) & 1;

    in[0][i] = (in[0][i] >> 1) | (in[1][i] << 63);
    in[1][i] = (in[1][i] >> 1) | (tmp << 63);
  }
}

// Used with GF(2^12)
static inline gf vec_reduce_gf12(vec *in) {
  int i;
  vec tmp;
  gf ret = 0;

  for (i = GFBITS - 1; i >= 0; i--) {
    tmp = in[i];

    tmp ^= tmp >> 32;
    tmp ^= tmp >> 16;
    tmp ^= tmp >> 8;
    tmp ^= tmp >> 4;
    tmp ^= tmp >> 2;
    tmp ^= tmp >> 1;

    ret <<= 1;
    ret |= tmp & 1;
  }

  return ret;
}

// used with GF(2^13)
static inline gf vec_reduce_gf13(vec in[][GFBITS]) {
  int i;
  vec tmp;
  gf ret = 0;

  for (i = GFBITS - 1; i >= 0; i--) {
    tmp = in[0][i] ^ in[1][i];

    tmp ^= tmp >> 32;
    tmp ^= tmp >> 16;
    tmp ^= tmp >> 8;
    tmp ^= tmp >> 4;
    tmp ^= tmp >> 2;
    tmp ^= tmp >> 1;

    ret <<= 1;
    ret |= tmp & 1;
  }

  return ret;
}

void bm348864(vec *out, vec in[][GFBITS]) {
  uint16_t i;
  uint16_t N, L;

  vec prod[GFBITS];
  vec in_tmp[GFBITS];

  vec d_vec[GFBITS];
  vec b_vec[GFBITS];
  vec B[GFBITS], C[GFBITS];
  vec B_tmp[GFBITS], C_tmp[GFBITS];

  vec mask, t;

  gf d, b, c0 = 1;

  gf coefs[SYS_T * 2];

  // init

  get_coefs(&coefs[0], in[0]);
  get_coefs(&coefs[64], in[1]);

  C[0] = 0;
  B[0] = 1;
  B[0] <<= 63;

  for (i = 1; i < GFBITS; i++)
    B[i] = C[i] = 0;

  b = 1;
  L = 0;

  //

  for (i = 0; i < GFBITS; i++)
    in_tmp[i] = 0;

  for (N = 0; N < SYS_T * 2; N++) {
    // computing d

    vec_mul(prod, in_tmp, C);

    update_gf12(in_tmp, coefs[N]);

    d = vec_reduce_gf12(prod);

    t = gf_mul2(c0, coefs[N], b);
    d ^= t & 0xFFFFFFFF;

    // 3 cases

    mask = mask_nonzero_gf12(d) & mask_leq(L * 2, N);

    for (i = 0; i < GFBITS; i++) {
      d_vec[i] = vec_setbits((d >> i) & 1);
      b_vec[i] = vec_setbits((b >> i) & 1);
    }

    vec_mul(B_tmp, d_vec, B);
    vec_mul(C_tmp, b_vec, C);

    vec_cmov(B, C, mask);
    update_gf12(B, mask & c0);

    for (i = 0; i < GFBITS; i++)
      C[i] = B_tmp[i] ^ C_tmp[i];

    c0 = t >> 32;
    b = (d & mask) | (b & ~mask);
    L = ((N + 1 - L) & mask) | (L & ~mask);
  }

  c0 = gf_inv(c0);

  for (i = 0; i < GFBITS; i++)
    out[i] = vec_setbits((c0 >> i) & 1);

  vec_mul(out, out, C);
}

void bm460896(vec out[][GFBITS], vec in[][GFBITS]) {
  int i;
  uint16_t N, L;
  uint16_t mask;
  uint64_t one = 1;

  vec prod[2][GFBITS];
  vec interval[2][GFBITS];
  vec dd[2][GFBITS], bb[2][GFBITS];
  vec B[2][GFBITS], C[2][GFBITS];
  vec B_tmp[2][GFBITS], C_tmp[2][GFBITS];

  gf d, b;
  gf coefs[256];

  // initialization

  get_coefs(&coefs[0], in[0]);
  get_coefs(&coefs[64], in[1]);
  get_coefs(&coefs[128], in[2]);
  get_coefs(&coefs[192], in[3]);

  C[0][0] = 0;
  C[1][0] = one << 63;
  B[0][0] = 0;
  B[1][0] = one << 62;

  for (i = 1; i < GFBITS; i++)
    C[0][i] = C[1][i] = B[0][i] = B[1][i] = 0;

  b = 1;
  L = 0;

  //

  for (i = 0; i < GFBITS; i++)
    interval[0][i] = interval[1][i] = 0;

  for (N = 0; N < SYS_T * 2; N++) {
    update_gf13(interval, coefs[N]);

    vec_mul(prod[0], C[0], interval[0]);
    vec_mul(prod[1], C[1], interval[1]);

    d = vec_reduce_gf13(prod);

    mask = mask_nonzero_gf13(d) & mask_leq(L * 2, N);

    for (i = 0; i < GFBITS; i++) {
      dd[0][i] = dd[1][i] = vec_setbits((d >> i) & 1);
      bb[0][i] = bb[1][i] = vec_setbits((b >> i) & 1);
    }

    vec_mul(B_tmp[0], dd[0], B[0]);
    vec_mul(B_tmp[1], dd[1], B[1]);
    vec_mul(C_tmp[0], bb[0], C[0]);
    vec_mul(C_tmp[1], bb[1], C[1]);

    vec_cmov(B[0], C[0], mask);
    vec_cmov(B[1], C[1], mask);
    update_gf13(B, 0);

    for (i = 0; i < GFBITS; i++) {
      C[0][i] = B_tmp[0][i] ^ C_tmp[0][i];
      C[1][i] = B_tmp[1][i] ^ C_tmp[1][i];
    }

    b = (d & mask) | (b & ~mask);
    L = ((N + 1 - L) & mask) | (L & ~mask);
  }

  for (i = 0; i < GFBITS; i++) {
    out[0][i] = (C[0][i] >> 31) | (C[1][i] << 33);
    out[1][i] = C[1][i] >> 31;
  }
}

void bm6688128(vec out[][GFBITS], vec in[][GFBITS]) {
  int i;
  uint16_t N, L;
  uint16_t mask;
  uint64_t one = 1, t;

  vec prod[2][GFBITS];
  vec interval[2][GFBITS];
  vec dd[2][GFBITS], bb[2][GFBITS];
  vec B[2][GFBITS], C[2][GFBITS];
  vec B_tmp[2][GFBITS], C_tmp[2][GFBITS];
  vec v[GFBITS];

  gf d, b, c0 = 1;
  gf coefs[256];

  // initialization

  get_coefs(&coefs[0], in[0]);
  get_coefs(&coefs[64], in[1]);
  get_coefs(&coefs[128], in[2]);
  get_coefs(&coefs[192], in[3]);

  C[0][0] = 0;
  C[1][0] = 0;
  B[0][0] = 0;
  B[1][0] = one << 63;

  for (i = 1; i < GFBITS; i++)
    C[0][i] = C[1][i] = B[0][i] = B[1][i] = 0;

  b = 1;
  L = 0;

  //

  for (i = 0; i < GFBITS; i++)
    interval[0][i] = interval[1][i] = 0;

  for (N = 0; N < 256; N++) {
    vec_mul(prod[0], C[0], interval[0]);
    vec_mul(prod[1], C[1], interval[1]);
    update_gf13(interval, coefs[N]);
    d = vec_reduce_gf13(prod);

    t = gf_mul2(c0, coefs[N], b);
    d ^= t & 0xFFFFFFFF;

    mask = mask_nonzero_gf13(d) & mask_leq(L * 2, N);

    for (i = 0; i < GFBITS; i++) {
      dd[0][i] = dd[1][i] = vec_setbits((d >> i) & 1);
      bb[0][i] = bb[1][i] = vec_setbits((b >> i) & 1);
    }

    vec_mul(B_tmp[0], dd[0], B[0]);
    vec_mul(B_tmp[1], dd[1], B[1]);
    vec_mul(C_tmp[0], bb[0], C[0]);
    vec_mul(C_tmp[1], bb[1], C[1]);

    vec_cmov(B[0], C[0], mask);
    vec_cmov(B[1], C[1], mask);
    update_gf13(B, c0 & mask);

    for (i = 0; i < GFBITS; i++) {
      C[0][i] = B_tmp[0][i] ^ C_tmp[0][i];
      C[1][i] = B_tmp[1][i] ^ C_tmp[1][i];
    }

    c0 = t >> 32;
    b = (d & mask) | (b & ~mask);
    L = ((N + 1 - L) & mask) | (L & ~mask);
  }

  c0 = gf_inv(c0);

  for (i = 0; i < GFBITS; i++)
    v[i] = vec_setbits((c0 >> i) & 1);

  vec_mul(out[0], C[0], v);
  vec_mul(out[1], C[1], v);
}

void bm6960119(vec out[][GFBITS], vec in[][GFBITS]) {
  int i;
  uint16_t N, L;
  uint16_t mask;
  uint64_t one = 1;

  vec prod[2][GFBITS];
  vec interval[2][GFBITS];
  vec dd[2][GFBITS], bb[2][GFBITS];
  vec B[2][GFBITS], C[2][GFBITS];
  vec B_tmp[2][GFBITS], C_tmp[2][GFBITS];

  gf d, b;
  gf coefs[256];

  // initialization

  get_coefs(&coefs[0], in[0]);
  get_coefs(&coefs[64], in[1]);
  get_coefs(&coefs[128], in[2]);
  get_coefs(&coefs[192], in[3]);

  C[0][0] = 0;
  C[1][0] = one << 63;
  B[0][0] = 0;
  B[1][0] = one << 62;

  for (i = 1; i < GFBITS; i++)
    C[0][i] = C[1][i] = B[0][i] = B[1][i] = 0;

  b = 1;
  L = 0;

  //

  for (i = 0; i < GFBITS; i++)
    interval[0][i] = interval[1][i] = 0;

  for (N = 0; N < SYS_T * 2; N++) {
    update_gf13(interval, coefs[N]);

    vec_mul(prod[0], C[0], interval[0]);
    vec_mul(prod[1], C[1], interval[1]);

    d = vec_reduce_gf13(prod);

    mask = mask_nonzero_gf13(d) & mask_leq(L * 2, N);

    for (i = 0; i < GFBITS; i++) {
      dd[0][i] = dd[1][i] = vec_setbits((d >> i) & 1);
      bb[0][i] = bb[1][i] = vec_setbits((b >> i) & 1);
    }

    vec_mul(B_tmp[0], dd[0], B[0]);
    vec_mul(B_tmp[1], dd[1], B[1]);
    vec_mul(C_tmp[0], bb[0], C[0]);
    vec_mul(C_tmp[1], bb[1], C[1]);

    vec_cmov(B[0], C[0], mask);
    vec_cmov(B[1], C[1], mask);
    update_gf13(B, 0);

    for (i = 0; i < GFBITS; i++) {
      C[0][i] = B_tmp[0][i] ^ C_tmp[0][i];
      C[1][i] = B_tmp[1][i] ^ C_tmp[1][i];
    }

    b = (d & mask) | (b & ~mask);
    L = ((N + 1 - L) & mask) | (L & ~mask);
  }

  for (i = 0; i < GFBITS; i++) {
    out[0][i] = (C[0][i] >> 8) | (C[1][i] << 56);
    out[1][i] = C[1][i] >> 8;
  }
}

void bm8192128(vec out[][GFBITS], vec in[][GFBITS]) {
  int i;
  uint16_t N, L;
  uint16_t mask;
  uint64_t one = 1, t;

  vec prod[2][GFBITS];
  vec interval[2][GFBITS];
  vec dd[2][GFBITS], bb[2][GFBITS];
  vec B[2][GFBITS], C[2][GFBITS];
  vec B_tmp[2][GFBITS], C_tmp[2][GFBITS];
  vec v[GFBITS];

  gf d, b, c0 = 1;
  gf coefs[256];

  // initialization

  get_coefs(&coefs[0], in[0]);
  get_coefs(&coefs[64], in[1]);
  get_coefs(&coefs[128], in[2]);
  get_coefs(&coefs[192], in[3]);

  C[0][0] = 0;
  C[1][0] = 0;
  B[0][0] = 0;
  B[1][0] = one << 63;

  for (i = 1; i < GFBITS; i++)
    C[0][i] = C[1][i] = B[0][i] = B[1][i] = 0;

  b = 1;
  L = 0;

  //

  for (i = 0; i < GFBITS; i++)
    interval[0][i] = interval[1][i] = 0;

  for (N = 0; N < 256; N++) {
    vec_mul(prod[0], C[0], interval[0]);
    vec_mul(prod[1], C[1], interval[1]);
    update_gf13(interval, coefs[N]);
    d = vec_reduce_gf13(prod);

    t = gf_mul2(c0, coefs[N], b);
    d ^= t & 0xFFFFFFFF;

    mask = mask_nonzero_gf13(d) & mask_leq(L * 2, N);

    for (i = 0; i < GFBITS; i++) {
      dd[0][i] = dd[1][i] = vec_setbits((d >> i) & 1);
      bb[0][i] = bb[1][i] = vec_setbits((b >> i) & 1);
    }

    vec_mul(B_tmp[0], dd[0], B[0]);
    vec_mul(B_tmp[1], dd[1], B[1]);
    vec_mul(C_tmp[0], bb[0], C[0]);
    vec_mul(C_tmp[1], bb[1], C[1]);

    vec_cmov(B[0], C[0], mask);
    vec_cmov(B[1], C[1], mask);
    update_gf13(B, c0 & mask);

    for (i = 0; i < GFBITS; i++) {
      C[0][i] = B_tmp[0][i] ^ C_tmp[0][i];
      C[1][i] = B_tmp[1][i] ^ C_tmp[1][i];
    }

    c0 = t >> 32;
    b = (d & mask) | (b & ~mask);
    L = ((N + 1 - L) & mask) | (L & ~mask);
  }

  c0 = gf_inv(c0);

  for (i = 0; i < GFBITS; i++)
    v[i] = vec_setbits((c0 >> i) & 1);

  vec_mul(out[0], C[0], v);
  vec_mul(out[1], C[1], v);
}
