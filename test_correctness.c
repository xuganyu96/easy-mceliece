#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "avx/mceliece348864/api.h"
#include "avx/mceliece348864/operations.h"

int main(void) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  uint8_t ss_cmp[CRYPTO_BYTES];

  crypto_kem_keypair(pk, sk);
  crypto_kem_enc(ct, ss, pk);
  crypto_kem_dec(ss_cmp, ct, sk);

  uint8_t diff = 0;
  for (size_t i = 0; i < CRYPTO_BYTES; i++) {
    diff |= ss[i] ^ ss_cmp[i];
  }
  if (diff) {
    printf("Decapsulation failed\n");
    exit(EXIT_FAILURE);
  }
  printf("Ok.\n");
  exit(EXIT_SUCCESS);
}
