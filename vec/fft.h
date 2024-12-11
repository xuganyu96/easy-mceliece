/*
  This file is for the Gao-Mateer FFT
  sse http://www.math.clemson.edu/~sgao/papers/GM10.pdf
*/

#ifndef FFT_H
#define FFT_H

#include "params.h"
#include "vec.h"
#include <stdint.h>

#if (MCELIECE_N == 3488)
void fft(vec[][GFBITS], vec *);
#else
void fft(vec[][GFBITS], vec[][GFBITS]);
#endif

#endif
