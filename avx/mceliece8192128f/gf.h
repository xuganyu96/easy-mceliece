/*
  This file is for functions for field arithmetic
*/

#ifndef GF_H
#define GF_H

#include "params.h"

#include <stdint.h>

typedef uint16_t gf;

gf gf_iszero(gf);
gf gf_mul(gf, gf);
gf gf_frac(gf, gf);
gf gf_inv(gf);

void GF_mul(gf *, gf *, gf *);

/* 2 field multiplications */
static inline uint64_t gf_mul2(gf a, gf b0, gf b1) {
  int i;

  uint64_t tmp = 0;
  uint64_t t0;
  uint64_t t1;
  uint64_t t;
  uint64_t mask = 0x0000000100000001;

  t0 = a;
  t1 = b1;
  t1 = (t1 << 32) | b0;

  for (i = 0; i < GFBITS; i++) {
    tmp ^= t0 * (t1 & mask);
    mask += mask;
  }

  //

  t = tmp & 0x01FF000001FF0000;
  tmp ^= (t >> 9) ^ (t >> 10) ^ (t >> 12) ^ (t >> 13);

  t = tmp & 0x0000E0000000E000;
  tmp ^= (t >> 9) ^ (t >> 10) ^ (t >> 12) ^ (t >> 13);

  return tmp & 0x00001FFF00001FFF;
}

#endif
