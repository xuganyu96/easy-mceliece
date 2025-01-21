#ifndef crypto_kem_mceliece6960119_H
#define crypto_kem_mceliece6960119_H

#define crypto_kem_mceliece6960119_avx_PUBLICKEYBYTES 1047319
#define crypto_kem_mceliece6960119_avx_SECRETKEYBYTES 13948
#define crypto_kem_mceliece6960119_avx_CIPHERTEXTBYTES 194
#define crypto_kem_mceliece6960119_avx_BYTES 32

#ifdef __cplusplus
extern "C" {
#endif
extern int crypto_kem_mceliece6960119_avx_keypair(unsigned char *,
                                                  unsigned char *);
extern int crypto_kem_mceliece6960119_avx_enc(unsigned char *, unsigned char *,
                                              const unsigned char *);
extern int crypto_kem_mceliece6960119_avx_dec(unsigned char *,
                                              const unsigned char *,
                                              const unsigned char *);
#ifdef __cplusplus
}
#endif

#define crypto_kem_mceliece6960119_keypair                                     \
  crypto_kem_mceliece6960119_avx_keypair
#define crypto_kem_mceliece6960119_enc crypto_kem_mceliece6960119_avx_enc
#define crypto_kem_mceliece6960119_dec crypto_kem_mceliece6960119_avx_dec
#define crypto_kem_mceliece6960119_PUBLICKEYBYTES                              \
  crypto_kem_mceliece6960119_avx_PUBLICKEYBYTES
#define crypto_kem_mceliece6960119_SECRETKEYBYTES                              \
  crypto_kem_mceliece6960119_avx_SECRETKEYBYTES
#define crypto_kem_mceliece6960119_BYTES crypto_kem_mceliece6960119_avx_BYTES
#define crypto_kem_mceliece6960119_CIPHERTEXTBYTES                             \
  crypto_kem_mceliece6960119_avx_CIPHERTEXTBYTES

#endif
