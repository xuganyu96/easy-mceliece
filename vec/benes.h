/**
 * Benes network
 */
#ifndef BENES_H
#define BENES_H
#include "api.h"

/**
 * For mceliece348864, `benes` and `support_gen` are both implemented in benes.c
 * For all other variants, `benes` is implemented in benes.c and `support_gen`
 * is implemented in `vec.h` and `vec.c`
 */
#if (MCELIECE_N == 3488)
#include "gf.h"

void benes(uint64_t *, const unsigned char *, int);
void support_gen(gf *, const unsigned char *);

#else
#include "gf.h"
#include "vec.h"

void benes(vec *, const unsigned char *, int);

#endif

#endif
