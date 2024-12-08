/**
 * Various kinds of speed test
 */
#include "../easy-mceliece/api.h"
#include "../easy-mceliece/crypto_kem.h"
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

  uint64_t batch_times[BATCH_COUNT];

  for (size_t batch = 0; batch < BATCH_COUNT; batch++) {
    uint64_t start = get_clock_cpu();
    for (int call = 0; call < BATCH_SIZE; call++) {
      crypto_kem_dec(ss_cmp, ct, sk);
    }
    uint64_t total_dur = get_clock_cpu() - start;

    uint64_t overhead_start = get_clock_cpu();
    for (int call = 0; call < BATCH_SIZE; call++)
      ;
    uint64_t overhead_dur = get_clock_cpu() - overhead_start;

    batch_times[batch] = (total_dur - overhead_dur) / BATCH_SIZE;
  }

  // compute the medium
  qsort(batch_times, BATCH_COUNT, sizeof(uint64_t), uint64_t_cmp);
  printf("Medium %12s time: %llu\n", "decryption", batch_times[MEDIUM_LOC]);

  return 0;
}

static int benchmark_kem_enc() {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  crypto_kem_keypair(pk, sk);

  uint64_t batch_times[BATCH_COUNT];

  for (size_t batch = 0; batch < BATCH_COUNT; batch++) {
    uint64_t start = get_clock_cpu();
    for (int call = 0; call < BATCH_SIZE; call++) {
      crypto_kem_enc(ct, ss, pk);
    }
    uint64_t total_dur = get_clock_cpu() - start;

    uint64_t overhead_start = get_clock_cpu();
    for (int call = 0; call < BATCH_SIZE; call++)
      ;
    uint64_t overhead_dur = get_clock_cpu() - overhead_start;

    batch_times[batch] = (total_dur - overhead_dur) / BATCH_SIZE;
  }

  // compute the medium
  qsort(batch_times, BATCH_COUNT, sizeof(uint64_t), uint64_t_cmp);
  printf("Medium %12s time: %llu\n", "encryption", batch_times[MEDIUM_LOC]);

  return 0;
}

static int benchmark_kem_keypair() {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint64_t batch_times[BATCH_COUNT];

  for (size_t batch = 0; batch < BATCH_COUNT; batch++) {
    uint64_t start = get_clock_cpu();
    for (int call = 0; call < BATCH_SIZE; call++) {
      crypto_kem_keypair(pk, sk);
    }
    uint64_t total_dur = get_clock_cpu() - start;

    uint64_t overhead_start = get_clock_cpu();
    for (int call = 0; call < BATCH_SIZE; call++)
      ;
    uint64_t overhead_dur = get_clock_cpu() - overhead_start;

    batch_times[batch] = (total_dur - overhead_dur) / BATCH_SIZE;
  }

  // compute the medium
  qsort(batch_times, BATCH_COUNT, sizeof(uint64_t), uint64_t_cmp);
  printf("Medium %12s time: %llu\n", "keypair", batch_times[MEDIUM_LOC]);

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
