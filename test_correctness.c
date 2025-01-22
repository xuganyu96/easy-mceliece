#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "ref/mceliece348864/crypto_kem_mceliece348864.h"

int main(void) {
  uint8_t pk[crypto_kem_mceliece348864_ref_PUBLICKEYBYTES];
  uint8_t sk[crypto_kem_mceliece348864_ref_SECRETKEYBYTES];
  uint8_t ct[crypto_kem_mceliece348864_ref_CIPHERTEXTBYTES];
  uint8_t ss[crypto_kem_mceliece348864_ref_BYTES];
  uint8_t ss_cmp[crypto_kem_mceliece348864_ref_BYTES];

  crypto_kem_mceliece348864_ref_keypair(pk, sk);
  crypto_kem_mceliece348864_ref_enc(ct, ss, pk);
  crypto_kem_mceliece348864_ref_dec(ss_cmp, ct, sk);

  uint8_t diff = 0;
  for (size_t i = 0; i < crypto_kem_mceliece348864_BYTES; i++) {
    diff |= ss[i] ^ ss_cmp[i];
  }
  if (diff) {
    printf("Decapsulation failed\n");
    exit(EXIT_FAILURE);
  }
  printf("Ok.\n");
  exit(EXIT_SUCCESS);
}
