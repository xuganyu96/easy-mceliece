#include "mceliece8192128/api.h"
#include "mceliece8192128/crypto_kem.h"
#include <stdint.h>
#include <stdio.h>

static void println_hexstr(uint8_t *bytes, size_t len) {
  printf("0x");
  for (size_t i = 0; i < len; i++) {
    printf("%02X", bytes[i]);
  }
  printf("\n");
}

int main(void) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  uint8_t decap[CRYPTO_BYTES];

  crypto_kem_keypair(pk, sk);
  crypto_kem_enc(ct, ss, pk);
  println_hexstr(ss, CRYPTO_BYTES);
  crypto_kem_dec(decap, ct, sk);
  println_hexstr(decap, CRYPTO_BYTES);

  int diff = 0;
  for (int i = 0; i < CRYPTO_BYTES; i++) {
    diff |= ss[i] ^ decap[i];
  }
  if (diff) {
    printf("fail\n");
  } else {
    printf("success\n");
  }
  return 0;
}
