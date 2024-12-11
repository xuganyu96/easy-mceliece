/*
  This file is for Niederreiter encryption
*/

#ifndef ENCRYPT_H
#define ENCRYPT_H

void encrypt(unsigned char *, const unsigned char *, unsigned char *);
void gen_e(unsigned char *e);
void syndrome(unsigned char *s, const unsigned char *pk, unsigned char *e);

#endif
