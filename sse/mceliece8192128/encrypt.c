/*
  This file is for Niederreiter encryption
*/

#include "encrypt.h"

#include "params.h"
#include "randombytes.h"
#include "uint16_sort.h"
#include "util.h"

#include "subroutines/crypto_declassify.h"
#include "subroutines/crypto_uint32.h"
#include <stdint.h>

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
  int i, j, eq;

  uint16_t ind[SYS_T];
  unsigned char bytes[sizeof(ind)];
  uint64_t e_int[SYS_N / 64];
  uint64_t one = 1;
  uint64_t mask;
  uint64_t val[SYS_T];

  while (1) {
    randombytes(bytes, sizeof(bytes));

    for (i = 0; i < SYS_T; i++)
      ind[i] = load_gf(bytes + i * 2);

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

  for (i = 0; i < SYS_N / 64; i++) {
    e_int[i] = 0;

    for (j = 0; j < SYS_T; j++) {
      mask = i ^ (ind[j] >> 6);
      mask -= 1;
      mask >>= 63;
      mask = -mask;

      e_int[i] |= val[j] & mask;
    }
  }

  for (i = 0; i < SYS_N / 64; i++)
    store8(e + i * 8, e_int[i]);
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
