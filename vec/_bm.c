/**
 * Attempt at unuifying the implementations of routines in bm.c
 */
#include "gf.h"
#include "vec.h"

static inline uint16_t mask_nonzero(gf a);

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

static inline void get_coefs(gf *out, vec *in);
static void update(vec in[][GFBITS], const gf e);
void bm(vec out[][GFBITS], vec in[][GFBITS]);
