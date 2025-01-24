/*
  This file is for Niederreiter encryption
*/

#ifndef ENCRYPT_H
#define ENCRYPT_H

#include <stdint.h>

void encrypt(unsigned char *ct, const unsigned char *pk, unsigned char *e);
void syndrome(uint8_t *ct, const uint8_t *pk, const uint8_t *e);
void gen_e(uint8_t *e);

#endif
