/*
  This file is for public-key generation
*/

#include "pk_gen.h"

#include "benes.h"
#include "controlbits.h"
#include "fft.h"
#include "params.h"
#include "subroutines/crypto_declassify.h"
#include "subroutines/crypto_uint64.h"
#include "transpose.h"
#include "uint64_sort.h"
#include "util.h"

static crypto_uint64 uint64_is_equal_declassify(uint64_t t, uint64_t u) {
  crypto_uint64 mask = crypto_uint64_equal_mask(t, u);
  crypto_declassify(&mask, sizeof mask);
  return mask;
}

static crypto_uint64 uint64_is_zero_declassify(uint64_t t) {
  crypto_uint64 mask = crypto_uint64_zero_mask(t);
  crypto_declassify(&mask, sizeof mask);
  return mask;
}

#include <stdint.h>

#define min(a, b) ((a < b) ? a : b)

static void de_bitslicing(uint64_t *out, const vec in[][GFBITS]) {
  int i, j, r;

  for (i = 0; i < (1 << GFBITS); i++)
    out[i] = 0;

  for (i = 0; i < 64; i++)
    for (j = GFBITS - 1; j >= 0; j--)
      for (r = 0; r < 64; r++) {
        out[i * 64 + r] <<= 1;
        out[i * 64 + r] |= (in[i][j] >> r) & 1;
      }
}

static void to_bitslicing_2x(vec out0[][GFBITS], vec out1[][GFBITS],
                             const uint64_t *in) {
  int i, j, r;

  for (i = 0; i < 64; i++) {
    for (j = GFBITS - 1; j >= 0; j--)
      for (r = 63; r >= 0; r--) {
        out1[i][j] <<= 1;
        out1[i][j] |= (in[i * 64 + r] >> (j + GFBITS)) & 1;
      }

    for (j = GFBITS - 1; j >= 0; j--)
      for (r = 63; r >= 0; r--) {
        out0[i][GFBITS - 1 - j] <<= 1;
        out0[i][GFBITS - 1 - j] |= (in[i * 64 + r] >> j) & 1;
      }
  }
}

/* return number of trailing zeros of in */
static inline int ctz(uint64_t in) {
  int i, b, m = 0, r = 0;

  for (i = 0; i < 64; i++) {
    b = (in >> i) & 1;
    m |= b;
    r += (m ^ 1) & (b ^ 1);
  }

  return r;
}

static inline uint64_t same_mask(uint16_t x, uint16_t y) {
  uint64_t mask;

  mask = x ^ y;
  mask -= 1;
  mask >>= 63;
  mask = -mask;

  return mask;
}

static int mov_columns(uint64_t mat[][((SYS_N + 63) / 64)], int16_t *pi,
                       uint64_t *pivots) {
  int i, j, k, s, block_idx, row;
  uint64_t buf[64], ctz_list[32], t, d, mask, allone = -1, one = 1;

  row = PK_NROWS - 32;
  block_idx = row / 64;

  // extract the 32x64 matrix

  for (i = 0; i < 32; i++)
    buf[i] = (mat[row + i][block_idx + 0] >> 32) |
             (mat[row + i][block_idx + 1] << 32);

  // compute the column indices of pivots by Gaussian elimination.
  // the indices are stored in ctz_list

  *pivots = 0;

  for (i = 0; i < 32; i++) {
    t = buf[i];
    for (j = i + 1; j < 32; j++)
      t |= buf[j];

    if (uint64_is_zero_declassify(t))
      return -1; // return if buf is not full rank

    ctz_list[i] = s = ctz(t);
    *pivots |= one << ctz_list[i];

    for (j = i + 1; j < 32; j++) {
      mask = (buf[i] >> s) & 1;
      mask -= 1;
      buf[i] ^= buf[j] & mask;
    }
    for (j = i + 1; j < 32; j++) {
      mask = (buf[j] >> s) & 1;
      mask = -mask;
      buf[j] ^= buf[i] & mask;
    }
  }

  // updating permutation

  for (j = 0; j < 32; j++)
    for (k = j + 1; k < 64; k++) {
      d = pi[row + j] ^ pi[row + k];
      d &= same_mask(k, ctz_list[j]) & 0xFFFF;
      pi[row + j] ^= d;
      pi[row + k] ^= d;
    }

  // moving columns of mat according to the column indices of pivots

  for (i = 0; i < PK_NROWS; i++) {
    t = (mat[i][block_idx + 0] >> 32) | (mat[i][block_idx + 1] << 32);

    for (j = 0; j < 32; j++) {
      d = t >> j;
      d ^= t >> ctz_list[j];
      d &= 1;

      t ^= d << ctz_list[j];
      t ^= d << j;
    }

    mat[i][block_idx + 0] =
        (mat[i][block_idx + 0] & (allone >> 32)) | (t << 32);
    mat[i][block_idx + 1] =
        (mat[i][block_idx + 1] & (allone << 32)) | (t >> 32);
  }

  return 0;
}

int pk_gen(unsigned char *pk, const unsigned char *irr, uint32_t *perm,
           int16_t *pi, uint64_t *pivots) {
  const int nblocks_H = (SYS_N + 63) / 64;
  const int nblocks_I = (PK_NROWS + 63) / 64;

  int i, j, k;
  int row, c;

  uint64_t mat[PK_NROWS][nblocks_H];
  uint64_t ops[PK_NROWS][nblocks_I];

  uint64_t mask;

  uint64_t irr_int[GFBITS];

  vec consts[64][GFBITS];
  vec eval[64][GFBITS];
  vec prod[64][GFBITS];
  vec tmp[GFBITS];

  uint64_t list[1 << GFBITS];

  // compute the inverses

  irr_load(irr_int, irr);

  fft(eval, irr_int);

  vec_copy(prod[0], eval[0]);

  for (i = 1; i < 64; i++)
    vec_mul(prod[i], prod[i - 1], eval[i]);

  vec_inv(tmp, prod[63]);

  for (i = 62; i >= 0; i--) {
    vec_mul(prod[i + 1], prod[i], tmp);
    vec_mul(tmp, tmp, eval[i + 1]);
  }

  vec_copy(prod[0], tmp);

  // fill matrix

  de_bitslicing(list, prod);

  for (i = 0; i < (1 << GFBITS); i++) {
    list[i] <<= GFBITS;
    list[i] |= i;
    list[i] |= ((uint64_t)perm[i]) << 31;
  }

  uint64_sort(list, 1 << GFBITS);

  for (i = 1; i < (1 << GFBITS); i++)
    if (uint64_is_equal_declassify(list[i - 1] >> 31, list[i] >> 31))
      return -1;

  to_bitslicing_2x(consts, prod, list);

  for (i = 0; i < (1 << GFBITS); i++)
    pi[i] = list[i] & GFMASK;

  for (j = 0; j < nblocks_H; j++)
    for (k = 0; k < GFBITS; k++)
      mat[k][j] = prod[j][k];

  for (i = 1; i < SYS_T; i++)
    for (j = 0; j < nblocks_H; j++) {
      vec_mul(prod[j], prod[j], consts[j]);

      for (k = 0; k < GFBITS; k++)
        mat[i * GFBITS + k][j] = prod[j][k];
    }

  // gaussian elimination

  for (i = 0; i < PK_NROWS; i++)
    for (j = 0; j < nblocks_I; j++)
      ops[i][j] = 0;

  for (i = 0; i < PK_NROWS; i++) {
    ops[i][i / 64] = 1;
    ops[i][i / 64] <<= (i % 64);
  }

  for (row = 0; row < PK_NROWS; row++) {
    i = row >> 6;
    j = row & 63;

    if (row == PK_NROWS - 32) {
      if (mov_columns(mat, pi, pivots))
        return -1;
    }

    for (k = row + 1; k < PK_NROWS; k++) {
      mask = mat[row][i] >> j;
      mask &= 1;
      mask -= 1;

      for (c = 0; c < nblocks_H; c++)
        mat[row][c] ^= mat[k][c] & mask;
    }

    if (uint64_is_zero_declassify((mat[row][i] >> j) &
                                  1)) // return if not systematic
    {
      return -1;
    }

    for (k = 0; k < row; k++) {
      mask = mat[k][i] >> j;
      mask &= 1;
      mask = -mask;

      for (c = 0; c < nblocks_H; c++)
        mat[k][c] ^= mat[row][c] & mask;
    }

    for (k = row + 1; k < PK_NROWS; k++) {
      mask = mat[k][i] >> j;
      mask &= 1;
      mask = -mask;

      for (c = 0; c < nblocks_H; c++)
        mat[k][c] ^= mat[row][c] & mask;
    }
  }

  for (i = 0; i < PK_NROWS; i++) {
    for (j = nblocks_I; j < nblocks_H - 1; j++) {
      store8(pk, mat[i][j]);
      pk += 8;
    }

    store_i(pk, mat[i][j], PK_ROW_BYTES % 8);

    pk += PK_ROW_BYTES % 8;
  }

  //

  return 0;
}
