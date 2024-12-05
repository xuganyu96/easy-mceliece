#ifndef OPERATIONS_H
#define OPERATIONS_H

#define PUBLICKEYBYTES 1047319
#define SECRETKEYBYTES 13948
#define CIPHERTEXTBYTES 194
#define SSBYTES 32

int crypto_kem_enc(unsigned char *c, unsigned char *key,
                   const unsigned char *pk);

int crypto_kem_dec(unsigned char *key, const unsigned char *c,
                   const unsigned char *sk);

int crypto_kem_keypair(unsigned char *pk, unsigned char *sk);

#endif
