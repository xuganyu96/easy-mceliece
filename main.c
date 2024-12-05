#include "mceliece/mceliece6960119/operations.h"
#include <stdint.h>
#include <stdio.h>

int main(void) {
  uint8_t pk[PUBLICKEYBYTES];
  uint8_t sk[SECRETKEYBYTES];
  uint8_t ct[CIPHERTEXTBYTES];
  uint8_t ss[SSBYTES];
  uint8_t decap[SSBYTES];

  crypto_kem_keypair(pk, sk);
  crypto_kem_enc(ct, ss, pk);
  crypto_kem_dec(decap, ct, sk);

  int diff = 0;
  for (int i = 0; i < SSBYTES; i++) {
    diff |= ss[i] ^ decap[i];
  }
  if (diff) {
    printf("fail\n");
  } else {
    printf("success\n");
  }
  return 0;
}
