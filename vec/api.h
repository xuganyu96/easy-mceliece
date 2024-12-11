#ifndef API_H
#define API_H

#ifndef MCELIECE_N
#define MCELIECE_N 3488
#endif

#if (MCELIECE_N == 3488)
#define CRYPTO_PUBLICKEYBYTES 261120
#define CRYPTO_SECRETKEYBYTES 6492
#define CRYPTO_CIPHERTEXTBYTES 96
#define CRYPTO_BYTES 32

#elif (MCELIECE_N == 4608)
#define CRYPTO_PUBLICKEYBYTES 524160
#define CRYPTO_SECRETKEYBYTES 13608
#define CRYPTO_CIPHERTEXTBYTES 156
#define CRYPTO_BYTES 32

#elif (MCELIECE_N == 6688)
#define CRYPTO_PUBLICKEYBYTES 1044992
#define CRYPTO_SECRETKEYBYTES 13932
#define CRYPTO_CIPHERTEXTBYTES 208
#define CRYPTO_BYTES 32

#elif (MCELIECE_N == 6960)
#define CRYPTO_PUBLICKEYBYTES 1047319
#define CRYPTO_SECRETKEYBYTES 13948
#define CRYPTO_CIPHERTEXTBYTES 194
#define CRYPTO_BYTES 32

#elif (MCELIECE_N == 8192)
#define CRYPTO_PUBLICKEYBYTES 1357824
#define CRYPTO_SECRETKEYBYTES 14120
#define CRYPTO_CIPHERTEXTBYTES 208
#define CRYPTO_BYTES 32

#else
#error "MCELIECE_N must be one of 3488, 4608, 6688, 6960, 8192"
#endif

#endif
