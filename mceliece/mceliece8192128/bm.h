/*
  This file is for the Berlekamp-Massey algorithm
  see http://crypto.stanford.edu/~mironov/cs359/massey.pdf
*/

#ifndef BM_H
#define BM_H
// #define bm CRYPTO_NAMESPACE(bm)
#include "gf.h"

void bm(gf *, gf *);

#endif
