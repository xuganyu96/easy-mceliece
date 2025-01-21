/*
  This file is for the Gao-Mateer FFT
  sse http://www.math.clemson.edu/~sgao/papers/GM10.pdf
*/

#ifndef FFT_H
#define FFT_H

#include "params.h"
#include "vec128.h"
#include <stdint.h>

void fft(vec128[][GFBITS], vec128 *);

#endif
