/*
  This file is for Nieddereiter decryption
*/

#ifndef DECRYPT_H
#define DECRYPT_H

int decrypt(unsigned char *, const unsigned char *, const unsigned char *);

// remove check_weight, check_synd,
// fft_tr(s_priv_cmp, scaled)
// scaling_inv(scaled, inv, error);
void cpa_decrypt(unsigned char *, const unsigned char *, const unsigned char *);

#endif
