#ifndef crypto_kem_mceliece6960119f_H
#define crypto_kem_mceliece6960119f_H

#define crypto_kem_mceliece6960119f_vec_PUBLICKEYBYTES 1047319
#define crypto_kem_mceliece6960119f_vec_SECRETKEYBYTES 13948
#define crypto_kem_mceliece6960119f_vec_CIPHERTEXTBYTES 194
#define crypto_kem_mceliece6960119f_vec_BYTES 32

#ifdef __cplusplus
extern "C" {
#endif
extern int crypto_kem_mceliece6960119f_vec_keypair(unsigned char *,
                                                   unsigned char *);
extern int crypto_kem_mceliece6960119f_vec_enc(unsigned char *, unsigned char *,
                                               const unsigned char *);
extern int crypto_kem_mceliece6960119f_vec_dec(unsigned char *,
                                               const unsigned char *,
                                               const unsigned char *);
#ifdef __cplusplus
}
#endif

#define crypto_kem_mceliece6960119f_keypair                                    \
  crypto_kem_mceliece6960119f_vec_keypair
#define crypto_kem_mceliece6960119f_enc crypto_kem_mceliece6960119f_vec_enc
#define crypto_kem_mceliece6960119f_dec crypto_kem_mceliece6960119f_vec_dec
#define crypto_kem_mceliece6960119f_PUBLICKEYBYTES                             \
  crypto_kem_mceliece6960119f_vec_PUBLICKEYBYTES
#define crypto_kem_mceliece6960119f_SECRETKEYBYTES                             \
  crypto_kem_mceliece6960119f_vec_SECRETKEYBYTES
#define crypto_kem_mceliece6960119f_BYTES crypto_kem_mceliece6960119f_vec_BYTES
#define crypto_kem_mceliece6960119f_CIPHERTEXTBYTES                            \
  crypto_kem_mceliece6960119f_vec_CIPHERTEXTBYTES

#endif
