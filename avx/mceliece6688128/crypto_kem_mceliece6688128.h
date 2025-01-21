#ifndef crypto_kem_mceliece6688128_H
#define crypto_kem_mceliece6688128_H

#define crypto_kem_mceliece6688128_avx_PUBLICKEYBYTES 1044992
#define crypto_kem_mceliece6688128_avx_SECRETKEYBYTES 13932
#define crypto_kem_mceliece6688128_avx_CIPHERTEXTBYTES 208
#define crypto_kem_mceliece6688128_avx_BYTES 32

#ifdef __cplusplus
extern "C" {
#endif
extern int crypto_kem_mceliece6688128_avx_keypair(unsigned char *,
                                                  unsigned char *);
extern int crypto_kem_mceliece6688128_avx_enc(unsigned char *, unsigned char *,
                                              const unsigned char *);
extern int crypto_kem_mceliece6688128_avx_dec(unsigned char *,
                                              const unsigned char *,
                                              const unsigned char *);
#ifdef __cplusplus
}
#endif

#define crypto_kem_mceliece6688128_keypair                                     \
  crypto_kem_mceliece6688128_avx_keypair
#define crypto_kem_mceliece6688128_enc crypto_kem_mceliece6688128_avx_enc
#define crypto_kem_mceliece6688128_dec crypto_kem_mceliece6688128_avx_dec
#define crypto_kem_mceliece6688128_PUBLICKEYBYTES                              \
  crypto_kem_mceliece6688128_avx_PUBLICKEYBYTES
#define crypto_kem_mceliece6688128_SECRETKEYBYTES                              \
  crypto_kem_mceliece6688128_avx_SECRETKEYBYTES
#define crypto_kem_mceliece6688128_BYTES crypto_kem_mceliece6688128_avx_BYTES
#define crypto_kem_mceliece6688128_CIPHERTEXTBYTES                             \
  crypto_kem_mceliece6688128_avx_CIPHERTEXTBYTES

#endif
