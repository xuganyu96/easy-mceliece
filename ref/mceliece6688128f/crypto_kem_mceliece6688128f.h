#ifndef crypto_kem_mceliece6688128f_H
#define crypto_kem_mceliece6688128f_H

#define crypto_kem_mceliece6688128f_ref_PUBLICKEYBYTES 1044992
#define crypto_kem_mceliece6688128f_ref_SECRETKEYBYTES 13932
#define crypto_kem_mceliece6688128f_ref_CIPHERTEXTBYTES 208
#define crypto_kem_mceliece6688128f_ref_BYTES 32

#ifdef __cplusplus
extern "C" {
#endif
extern int crypto_kem_mceliece6688128f_ref_keypair(unsigned char *,
                                                   unsigned char *);
extern int crypto_kem_mceliece6688128f_ref_enc(unsigned char *, unsigned char *,
                                               const unsigned char *);
extern int crypto_kem_mceliece6688128f_ref_dec(unsigned char *,
                                               const unsigned char *,
                                               const unsigned char *);
#ifdef __cplusplus
}
#endif

#define crypto_kem_mceliece6688128f_keypair                                    \
  crypto_kem_mceliece6688128f_ref_keypair
#define crypto_kem_mceliece6688128f_enc crypto_kem_mceliece6688128f_ref_enc
#define crypto_kem_mceliece6688128f_dec crypto_kem_mceliece6688128f_ref_dec
#define crypto_kem_mceliece6688128f_PUBLICKEYBYTES                             \
  crypto_kem_mceliece6688128f_ref_PUBLICKEYBYTES
#define crypto_kem_mceliece6688128f_SECRETKEYBYTES                             \
  crypto_kem_mceliece6688128f_ref_SECRETKEYBYTES
#define crypto_kem_mceliece6688128f_BYTES crypto_kem_mceliece6688128f_ref_BYTES
#define crypto_kem_mceliece6688128f_CIPHERTEXTBYTES                            \
  crypto_kem_mceliece6688128f_ref_CIPHERTEXTBYTES

#endif
