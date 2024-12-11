#include "benes.h"
#include "api.h"
#include "params.h"
#include "transpose.h"
#include "util.h"

// mceliece348864 has distinct benes.c implementation from all other variants
#if (MCELIECE_N == 3488)
/* one layer of the benes network */
static void layer(uint64_t *data, uint64_t *bits, int lgs) {
  int i, j, s;

  uint64_t d;

  s = 1 << lgs;

  for (i = 0; i < 64; i += s * 2)
    for (j = i; j < i + s; j++) {

      d = (data[j + 0] ^ data[j + s]);
      d &= (*bits++);
      data[j + 0] ^= d;
      data[j + s] ^= d;
    }
}

/* input: r, sequence of bits to be permuted */
/*        bits, condition bits of the Benes network */
/*        rev, 0 for normal application; !0 for inverse */
/* output: r, permuted bits */
void benes(uint64_t *r, const unsigned char *bits, int rev) {
  int i;

  const unsigned char *cond_ptr;
  int inc, low;

  uint64_t cond[64];

  //

  if (rev == 0) {
    inc = 256;
    cond_ptr = bits;
  } else {
    inc = -256;
    cond_ptr = bits + (2 * GFBITS - 2) * 256;
  }

  //

  transpose_64x64(r, r);

  for (low = 0; low <= 5; low++) {
    for (i = 0; i < 64; i++)
      cond[i] = load4(cond_ptr + i * 4);
    transpose_64x64(cond, cond);
    layer(r, cond, low);
    cond_ptr += inc;
  }

  transpose_64x64(r, r);

  for (low = 0; low <= 5; low++) {
    for (i = 0; i < 32; i++)
      cond[i] = load8(cond_ptr + i * 8);
    layer(r, cond, low);
    cond_ptr += inc;
  }
  for (low = 4; low >= 0; low--) {
    for (i = 0; i < 32; i++)
      cond[i] = load8(cond_ptr + i * 8);
    layer(r, cond, low);
    cond_ptr += inc;
  }

  transpose_64x64(r, r);

  for (low = 5; low >= 0; low--) {
    for (i = 0; i < 64; i++)
      cond[i] = load4(cond_ptr + i * 4);
    transpose_64x64(cond, cond);
    layer(r, cond, low);
    cond_ptr += inc;
  }

  transpose_64x64(r, r);
}

#else
/* middle layers of the benes network */
static void layer_in(uint64_t data[2][64], uint64_t *bits, int lgs) {
  int i, j, s;

  uint64_t d;

  s = 1 << lgs;

  for (i = 0; i < 64; i += s * 2)
    for (j = i; j < i + s; j++) {

      d = (data[0][j + 0] ^ data[0][j + s]);
      d &= (*bits++);
      data[0][j + 0] ^= d;
      data[0][j + s] ^= d;

      d = (data[1][j + 0] ^ data[1][j + s]);
      d &= (*bits++);
      data[1][j + 0] ^= d;
      data[1][j + s] ^= d;
    }
}

/* first and last layers of the benes network */
static void layer_ex(uint64_t *data, uint64_t *bits, int lgs) {
  int i, j, s;

  uint64_t d;

  s = 1 << lgs;

  for (i = 0; i < 128; i += s * 2)
    for (j = i; j < i + s; j++) {

      d = (data[j + 0] ^ data[j + s]);
      d &= (*bits++);
      data[j + 0] ^= d;
      data[j + s] ^= d;
    }
}

/* input: r, sequence of bits to be permuted */
/*        bits, condition bits of the Benes network */
/*        rev, 0 for normal application; !0 for inverse */
/* output: r, permuted bits */
void benes(vec *r, const unsigned char *bits, int rev) {
  int i, iter, inc;

  const unsigned char *bits_ptr;

  uint64_t r_int_v[2][64];
  uint64_t r_int_h[2][64];
  uint64_t b_int_v[64];
  uint64_t b_int_h[64];

  //

  if (rev) {
    bits_ptr = bits + 12288;
    inc = -1024;
  } else {
    bits_ptr = bits;
    inc = 0;
  }

  for (i = 0; i < 64; i++) {
    r_int_v[0][i] = r[i * 2 + 0];
    r_int_v[1][i] = r[i * 2 + 1];
  }

  transpose_64x64(r_int_h[0], r_int_v[0]);
  transpose_64x64(r_int_h[1], r_int_v[1]);

  for (iter = 0; iter <= 6; iter++) {
    for (i = 0; i < 64; i++) {
      b_int_v[i] = load8(bits_ptr);
      bits_ptr += 8;
    }

    bits_ptr += inc;

    transpose_64x64(b_int_h, b_int_v);

    layer_ex(r_int_h[0], b_int_h, iter);
  }

  transpose_64x64(r_int_v[0], r_int_h[0]);
  transpose_64x64(r_int_v[1], r_int_h[1]);

  for (iter = 0; iter <= 5; iter++) {
    for (i = 0; i < 64; i++) {
      b_int_v[i] = load8(bits_ptr);
      bits_ptr += 8;
    }
    bits_ptr += inc;

    layer_in(r_int_v, b_int_v, iter);
  }

  for (iter = 4; iter >= 0; iter--) {
    for (i = 0; i < 64; i++) {
      b_int_v[i] = load8(bits_ptr);
      bits_ptr += 8;
    }
    bits_ptr += inc;

    layer_in(r_int_v, b_int_v, iter);
  }

  transpose_64x64(r_int_h[0], r_int_v[0]);
  transpose_64x64(r_int_h[1], r_int_v[1]);

  for (iter = 6; iter >= 0; iter--) {
    for (i = 0; i < 64; i++) {
      b_int_v[i] = load8(bits_ptr);
      bits_ptr += 8;
    }

    bits_ptr += inc;

    transpose_64x64(b_int_h, b_int_v);

    layer_ex(r_int_h[0], b_int_h, iter);
  }

  transpose_64x64(r_int_v[0], r_int_h[0]);
  transpose_64x64(r_int_v[1], r_int_h[1]);

  for (i = 0; i < 64; i++) {
    r[i * 2 + 0] = r_int_v[0][i];
    r[i * 2 + 1] = r_int_v[1][i];
  }
}

#endif
