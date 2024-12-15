/**
 * Various kinds of speed test
 */
#include "../vec/api.h"
#include "../vec/crypto_kem.h"
#include "stopwatch.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#if defined(__APPLE__)
#include <mach/mach_time.h>
#define get_clock_cpu mach_absolute_time
#else
/**
 * Use the most portable CPU clock. See link below for how to read cycle counter
 * on various platforms:
 * https://github.com/google/benchmark/blob/v1.1.0/src/cycleclock.h#L116
 */
#include <time.h>
#define get_clock_cpu clock
#endif

// number of function calls within each batch
#define BATCH_SIZE 4
// number of batches per benchmark; preferably odd to so medium is easy
#define BATCH_COUNT 11
#define MEDIUM_LOC ((BATCH_COUNT - 1) / 2)

static int uint64_t_cmp(const void *a, const void *b) {
  uint64_t _a = *(uint64_t *)a;
  uint64_t _b = *(uint64_t *)b;
  if (_a < _b)
    return -1;
  if (_a > _b)
    return 1;
  return 0;
}

static int benchmark_kem_dec() {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  uint8_t ss_cmp[CRYPTO_BYTES];
  crypto_kem_keypair(pk, sk);
  crypto_kem_enc(ct, ss, pk);

  stopwatch_t stopwatch;
  stopwatch_init(&stopwatch);
  stopwatch_lap(&stopwatch, get_clock_cpu);

  for (int i = 0; i < STOPWATCH_CAPACITY; i++) {
    crypto_kem_dec(ss_cmp, ct, sk);
    stopwatch_lap(&stopwatch, get_clock_cpu);
  }

  stopwatch_pretty_statistics("KEM decap", &stopwatch);

  return 0;
}

static int benchmark_kem_enc() {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  crypto_kem_keypair(pk, sk);

  stopwatch_t stopwatch;
  stopwatch_init(&stopwatch);
  stopwatch_lap(&stopwatch, get_clock_cpu);

  for (int i = 0; i < STOPWATCH_CAPACITY; i++) {
    crypto_kem_enc(ct, ss, pk);
    stopwatch_lap(&stopwatch, get_clock_cpu);
  }

  stopwatch_pretty_statistics("KEM encap", &stopwatch);

  return 0;
}

static int benchmark_kem_keypair() {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  stopwatch_t stopwatch;
  stopwatch_init(&stopwatch);
  stopwatch_lap(&stopwatch, get_clock_cpu);

  for (int i = 0; i < STOPWATCH_CAPACITY; i++) {
    crypto_kem_keypair(pk, sk);
    stopwatch_lap(&stopwatch, get_clock_cpu);
  }

  stopwatch_pretty_statistics("KEM keypair", &stopwatch);

  return 0;
}

int main(void) {
  int fail = 0;

  fail |= benchmark_kem_keypair();
  fail |= benchmark_kem_enc();
  fail |= benchmark_kem_dec();

  if (fail) {
    fprintf(stderr, "Failed.\n");
    exit(EXIT_FAILURE);
  } else {
    printf("Ok.\n");
  }
  return 0;
}
