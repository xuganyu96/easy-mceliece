/*
  This file is for Niederreiter encryption
*/
#ifndef ENCRYPT_H
#define ENCRYPT_H

void encrypt(unsigned char *synd, const unsigned char *pk, unsigned char *err);
void syndrome(unsigned char *synd, const unsigned char *pk, unsigned char *err);
void gen_e(unsigned char *err);

#endif
