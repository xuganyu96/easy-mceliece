#include <stdint.h>
#include <stdio.h>

void crypto_hash_32b(uint8_t *out, const uint8_t *in, size_t inlen);
void shake(uint8_t *out, size_t outlen, const uint8_t *in, size_t inlen);
