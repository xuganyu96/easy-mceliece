#include "../vec/api.h"
#include "../vec/crypto_kem.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define TEST_ROUNDS 10

int main(void) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  uint8_t ss_cmp[CRYPTO_BYTES];

  crypto_kem_keypair(pk, sk);

  int diff = 0;
  for (int i = 0; i < TEST_ROUNDS; i++) {
    crypto_kem_enc(ct, ss, pk);
    crypto_kem_dec(ss_cmp, ct, sk);

    for (int i = 0; i < CRYPTO_BYTES; i++) {
      diff |= ss[i] ^ ss_cmp[i];
    }
  }
  if (diff) {
    printf("Fail\n");
    exit(EXIT_FAILURE);
  } else {
    printf("Ok\n");
  }
  return 0;
}
