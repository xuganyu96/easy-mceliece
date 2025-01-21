/*
  This file is for Niederreiter encryption
*/

#include "encrypt.h"

#include "params.h"
#include "randombytes.h"
#include "uint16_sort.h"
#include "util.h"

#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "gf.h"
#include "subroutines/crypto_declassify.h"
#include "subroutines/crypto_uint16.h"
#include "subroutines/crypto_uint32.h"

static inline crypto_uint16 uint16_is_smaller_declassify(uint16_t t,
                                                         uint16_t u) {
  crypto_uint16 mask = crypto_uint16_smaller_mask(t, u);
  crypto_declassify(&mask, sizeof mask);
  return mask;
}

static inline crypto_uint32 uint32_is_equal_declassify(uint32_t t, uint32_t u) {
  crypto_uint32 mask = crypto_uint32_equal_mask(t, u);
  crypto_declassify(&mask, sizeof mask);
  return mask;
}

/* input: public key pk, error vector e */
/* output: syndrome s */
extern void syndrome_asm(unsigned char *s, const unsigned char *pk,
                         unsigned char *e);

/* output: e, an error vector of weight t */
static void gen_e(unsigned char *e) {
  int i, j, eq, count;

  union {
    uint16_t nums[SYS_T * 2];
    unsigned char bytes[SYS_T * 2 * sizeof(uint16_t)];
  } buf;

  uint16_t ind[SYS_T];
  uint64_t e_int[(SYS_N + 63) / 64];
  uint64_t one = 1;
  uint64_t mask;
  uint64_t val[SYS_T];

  while (1) {
    randombytes(buf.bytes, sizeof(buf));

    for (i = 0; i < SYS_T * 2; i++)
      buf.nums[i] = load_gf(buf.bytes + i * 2);

    // moving and counting indices in the correct range

    count = 0;
    for (i = 0; i < SYS_T * 2 && count < SYS_T; i++)
      if (uint16_is_smaller_declassify(buf.nums[i], SYS_N))
        ind[count++] = buf.nums[i];

    if (count < SYS_T)
      continue;

    // check for repetition

    uint16_sort(ind, SYS_T);

    eq = 0;
    for (i = 1; i < SYS_T; i++)
      if (uint32_is_equal_declassify(ind[i - 1], ind[i]))
        eq = 1;

    if (eq == 0)
      break;
  }

  for (j = 0; j < SYS_T; j++)
    val[j] = one << (ind[j] & 63);

  for (i = 0; i < (SYS_N + 63) / 64; i++) {
    e_int[i] = 0;

    for (j = 0; j < SYS_T; j++) {
      mask = i ^ (ind[j] >> 6);
      mask -= 1;
      mask >>= 63;
      mask = -mask;

      e_int[i] |= val[j] & mask;
    }
  }

  for (i = 0; i < (SYS_N + 63) / 64; i++) {
    store8(e, e_int[i]);
    e += 8;
  }
}

/* input: public key pk */
/* output: error vector e, syndrome s */
void encrypt(unsigned char *s, const unsigned char *pk, unsigned char *e) {
  gen_e(e);

#ifdef KAT
  {
    int k;
    printf("encrypt e: positions");
    for (k = 0; k < SYS_N; ++k)
      if (e[k / 8] & (1 << (k & 7)))
        printf(" %d", k);
    printf("\n");
  }
#endif

  syndrome_asm(s, pk, e);
}
