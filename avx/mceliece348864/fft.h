/*
  This file is for the Gao-Mateer FFT
  sse http://www.math.clemson.edu/~sgao/papers/GM10.pdf
*/

#ifndef FFT_H
#define FFT_H

#include "params.h"
#include "vec128.h"
#include "vec256.h"
#include <stdint.h>

void fft(vec256[][GFBITS], uint64_t *);

#endif
