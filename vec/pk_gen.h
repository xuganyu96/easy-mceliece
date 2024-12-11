/*
  This file is for public-key generation
*/

#ifndef PK_GEN_H
#define PK_GEN_H

#include "gf.h"
#include <stdint.h>

int pk_gen(unsigned char *pk, const unsigned char *irr, uint32_t *perm,
           int16_t *pi, uint64_t *pivots);

#endif
