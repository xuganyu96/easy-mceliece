/*
  This file is for the inversion-free Berlekamp-Massey algorithm
  see https://ieeexplore.ieee.org/document/87857
*/

#ifndef BM_H
#define BM_H

#include "params.h"
#include "vec128.h"

void bm(vec128 *, vec128[][GFBITS]);

#endif
