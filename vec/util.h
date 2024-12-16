/**
 * Loading and storing data
 */
#ifndef UTIL_H
#define UTIL_H

#include "gf.h"
#include "vec.h"
#include <stdint.h>

/**
 * Store i of the least significant octets of the input to the output
 *
 * Data is stored in little-endian byte order: the least significant octet is
 * stored at a lower array index
 */
static inline void store_i(unsigned char *out, uint64_t in, int i) {
  int j;

  for (j = 0; j < i; j++)
    out[j] = (in >> (j * 8)) & 0xFF;
}

/**
 * Store a field element into the destination in little-endian byte order
 */
static inline void store_gf(unsigned char *dest, gf a) {
  dest[0] = a & 0xFF;
  dest[1] = a >> 8;
}

static inline gf load_gf(const unsigned char *src) {
  uint16_t a;

  a = src[1];
  a <<= 8;
  a |= src[0];

  return a & GFMASK;
}

static inline uint32_t load4(const unsigned char *src) {
  uint32_t a;

  a = src[3];
  a <<= 8;
  a |= src[2];
  a <<= 8;
  a |= src[1];
  a <<= 8;
  a |= src[0];

  return a;
}

static inline void store8(unsigned char *out, uint64_t in) {
  out[0] = (in >> 0x00) & 0xFF;
  out[1] = (in >> 0x08) & 0xFF;
  out[2] = (in >> 0x10) & 0xFF;
  out[3] = (in >> 0x18) & 0xFF;
  out[4] = (in >> 0x20) & 0xFF;
  out[5] = (in >> 0x28) & 0xFF;
  out[6] = (in >> 0x30) & 0xFF;
  out[7] = (in >> 0x38) & 0xFF;
}

static inline uint64_t load8(const unsigned char *in) {
  int i;
  uint64_t ret = in[7];

  for (i = 6; i >= 0; i--) {
    ret <<= 8;
    ret |= in[i];
  }

  return ret;
}

static inline void irr_load_gf12(uint64_t *out, const unsigned char *in) {
  int i, j;
  uint16_t irr[SYS_T + 1];

  for (i = 0; i < SYS_T; i++)
    irr[i] = load_gf(in + i * 2);

  irr[SYS_T] = 1;

  for (i = 0; i < GFBITS; i++)
    out[i] = 0;

  for (i = SYS_T; i >= 0; i--)
    for (j = 0; j < GFBITS; j++) {
      out[j] <<= 1;
      out[j] |= (irr[i] >> j) & 1;
    }
}

static inline void irr_load_gf13(vec out[][GFBITS], const unsigned char *in) {
  int i, j;
  uint64_t v[2];
  uint16_t irr[SYS_T + 1];

  for (i = 0; i < SYS_T; i++)
    irr[i] = load_gf(in + i * 2);

  irr[SYS_T] = 1;

  for (i = 0; i < GFBITS; i++) {
    v[0] = v[1] = 0;

    for (j = 63; j >= 0; j--) {
      v[0] <<= 1;
      v[0] |= (irr[j] >> i) & 1;
    }
    for (j = SYS_T; j >= 64; j--) {
      v[1] <<= 1;
      v[1] |= (irr[j] >> i) & 1;
    }

    out[0][i] = v[0];
    out[1][i] = v[1];
  }
}

static inline gf bitrev(gf a) {
  a = ((a & 0x00FF) << 8) | ((a & 0xFF00) >> 8);
  a = ((a & 0x0F0F) << 4) | ((a & 0xF0F0) >> 4);
  a = ((a & 0x3333) << 2) | ((a & 0xCCCC) >> 2);
  a = ((a & 0x5555) << 1) | ((a & 0xAAAA) >> 1);

  return a >> 4;
}

#endif
