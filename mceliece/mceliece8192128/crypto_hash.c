#include "crypto_hash.h"
#include "fips202.h"

void crypto_hash_32b(uint8_t *out, const uint8_t *in, size_t inlen) {
  keccak_state hasher;
  shake256_init(&hasher);
  shake256_absorb_once(&hasher, in, inlen);
  shake256_squeeze(out, 32, &hasher);
}

void shake(uint8_t *out, size_t outlen, const uint8_t *in, size_t inlen) {
  keccak_state hasher;
  shake256_init(&hasher);
  shake256_absorb_once(&hasher, in, inlen);
  shake256_squeeze(out, outlen, &hasher);
}
