/*
  This file is for Niederreiter decryption
*/

#ifndef DECRYPT_H
#define DECRYPT_H

int decrypt(unsigned char *e, const unsigned char *sk, const unsigned char *ct);
int cpa_decrypt(unsigned char *e, const unsigned char *sk, const unsigned char *ct);

#endif
