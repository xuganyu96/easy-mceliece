
/*
  This file is for the inversion-free Berlekamp-Massey algorithm
  see https://ieeexplore.ieee.org/document/87857
*/

#ifndef BM_H
#define BM_H

#include "api.h"
#include "params.h"
#include "vec.h"

#if (MCELIECE_N == 3488)
void bm(vec *, vec[][GFBITS]);
#else
void bm(vec out[][GFBITS], vec in[][GFBITS]);
#endif

#endif
