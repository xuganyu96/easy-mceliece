/*
  This file is for Niederreiter decryption
*/

#include "decrypt.h"

#include "benes.h"
#include "bm.h"
#include "fft.h"
#include "fft_tr.h"
#include "params.h"
#include "util.h"
#include "vec.h"

#include <stdio.h>

static void scaling(vec out[][GFBITS], vec inv[][GFBITS],
                    const unsigned char *sk, vec *recv) {
  int i, j;

  vec irr_int[GFBITS];
  vec eval[64][GFBITS];
  vec tmp[GFBITS];

  //

  irr_load(irr_int, sk);

  fft(eval, irr_int);

  for (i = 0; i < 64; i++)
    vec_sq(eval[i], eval[i]);

  vec_copy(inv[0], eval[0]);

  for (i = 1; i < 64; i++)
    vec_mul(inv[i], inv[i - 1], eval[i]);

  vec_inv(tmp, inv[63]);

  for (i = 62; i >= 0; i--) {
    vec_mul(inv[i + 1], tmp, inv[i]);
    vec_mul(tmp, tmp, eval[i + 1]);
  }

  vec_copy(inv[0], tmp);

  //

  for (i = 0; i < 64; i++)
    for (j = 0; j < GFBITS; j++)
      out[i][j] = inv[i][j] & recv[i];
}

static void preprocess(vec *recv, const unsigned char *s) {
  int i;
  unsigned char r[512];

  for (i = 0; i < SYND_BYTES; i++)
    r[i] = s[i];

  for (i = SYND_BYTES; i < 512; i++)
    r[i] = 0;

  for (i = 0; i < 64; i++)
    recv[i] = load8(r + i * 8);
}

static void postprocess(unsigned char *e, vec *err) {
  int i;
  unsigned char error8[(1 << GFBITS) / 8];

  for (i = 0; i < 64; i++)
    store8(error8 + i * 8, err[i]);

  for (i = 0; i < SYS_N / 8; i++)
    e[i] = error8[i];
}

static void scaling_inv(vec out[][GFBITS], vec inv[][GFBITS], vec *recv) {
  int i, j;

  for (i = 0; i < 64; i++)
    for (j = 0; j < GFBITS; j++)
      out[i][j] = inv[i][j] & recv[i];
}

static int weight_check(unsigned char *e, vec *error) {
  int i;
  uint16_t w0 = 0;
  uint16_t w1 = 0;
  uint16_t check;

  for (i = 0; i < (1 << GFBITS); i++)
    w0 += (error[i / 64] >> (i % 64)) & 1;

  for (i = 0; i < SYS_N; i++)
    w1 += (e[i / 8] >> (i % 8)) & 1;

  check = (w0 ^ SYS_T) | (w1 ^ SYS_T);
  check -= 1;
  check >>= 15;

  return check;
}

static uint16_t synd_cmp(vec s0[][GFBITS], vec s1[][GFBITS]) {
  int i, j;
  vec diff = 0;

  for (i = 0; i < 2; i++)
    for (j = 0; j < GFBITS; j++)
      diff |= (s0[i][j] ^ s1[i][j]);

  return vec_testz(diff);
}

/* Niederreiter decryption with the Berlekamp decoder */
/* intput: sk, secret key */
/*         s, ciphertext (syndrome) */
/* output: e, error vector */
/* return: 0 for success; 1 for failure */
int decrypt(unsigned char *e, const unsigned char *sk, const unsigned char *s) {
  int i;

  uint16_t check_synd;
  uint16_t check_weight;

  vec inv[64][GFBITS];
  vec scaled[64][GFBITS];
  vec eval[64][GFBITS];

  vec error[64];

  vec s_priv[2][GFBITS];
  vec s_priv_cmp[2][GFBITS];
  vec locator[GFBITS];

  vec recv[64];
  vec allone;

  // Berlekamp decoder

  preprocess(recv, s);

  benes(recv, sk + IRR_BYTES, 1);
  scaling(scaled, inv, sk, recv);
  fft_tr(s_priv, scaled);
  bm(locator, s_priv);

  fft(eval, locator);

  // reencryption and weight check

  allone = vec_setbits(1);

  for (i = 0; i < 64; i++) {
    error[i] = vec_or_reduce(eval[i]);
    error[i] ^= allone;
  }

  scaling_inv(scaled, inv, error);
  fft_tr(s_priv_cmp, scaled);

  check_synd = synd_cmp(s_priv, s_priv_cmp);

  //

  benes(error, sk + IRR_BYTES, 0);

  postprocess(e, error);

  check_weight = weight_check(e, error);

#ifdef KAT
  {
    int k;
    printf("decrypt e: positions");
    for (k = 0; k < SYS_N; ++k)
      if (e[k / 8] & (1 << (k & 7)))
        printf(" %d", k);
    printf("\n");
  }
#endif

  return 1 - (check_synd & check_weight);
}
