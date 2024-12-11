/**
 * Finite field arithmetics
 */
#ifndef GF_H
#define GF_H
#include "api.h"
#include "params.h"
#include <stdint.h>

typedef uint16_t gf;

gf gf_add(gf, gf);
gf gf_frac(gf, gf);
gf gf_inv(gf);
gf gf_iszero(gf);
gf gf_mul(gf, gf);
void GF_mul(gf *, gf *, gf *);

#if (MCELIECE_N == 3488)
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
  t = tmp & 0x007FC000007FC000;
  tmp ^= (t >> 9) ^ (t >> 12);
  t = tmp & 0x0000300000003000;
  tmp ^= (t >> 9) ^ (t >> 12);
  return tmp & 0x00000FFF00000FFF;
}
#elif (MCELIECE_N == 4608)
// TODO: 460896's implementation of gf_mul2 is elsewhere
#elif (MCELIECE_N == 6688)
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
  t = tmp & 0x01FF000001FF0000;
  tmp ^= (t >> 9) ^ (t >> 10) ^ (t >> 12) ^ (t >> 13);
  t = tmp & 0x0000E0000000E000;
  tmp ^= (t >> 9) ^ (t >> 10) ^ (t >> 12) ^ (t >> 13);
  return tmp & 0x00001FFF00001FFF;
}
#elif (MCELIECE_N == 6960)
// TODO: 6960119's implementation of gf_mul2 is elsewhere
#elif (MCELIECE_N == 8192)
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
  t = tmp & 0x01FF000001FF0000;
  tmp ^= (t >> 9) ^ (t >> 10) ^ (t >> 12) ^ (t >> 13);
  t = tmp & 0x0000E0000000E000;
  tmp ^= (t >> 9) ^ (t >> 10) ^ (t >> 12) ^ (t >> 13);
  return tmp & 0x00001FFF00001FFF;
}
#endif

#endif
