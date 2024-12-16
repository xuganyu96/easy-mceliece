
/*
  This file is for the inversion-free Berlekamp-Massey algorithm
  see https://ieeexplore.ieee.org/document/87857
*/

#ifndef BM_H
#define BM_H

#include "api.h"
#include "params.h"
#include "vec.h"

void bm348864(vec *out, vec in[][GFBITS]);
void bm460896(vec out[][GFBITS], vec in[][GFBITS]);
void bm6688128(vec out[][GFBITS], vec in[][GFBITS]);
void bm6960119(vec out[][GFBITS], vec in[][GFBITS]);
void bm8192128(vec out[][GFBITS], vec in[][GFBITS]);

#endif
