#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#if defined(__APPLE__)
#include <mach/mach_time.h>
#endif
#include "multiarch.h"

#ifndef SPEED_ROUNDS
#define SPEED_ROUNDS 10000
#endif

static uint64_t get_percentile(const uint64_t *arr, size_t arrlen,
                               double percentile) {
  int index = (int)ceil(percentile * (arrlen - 1)); // Calculate index
  return arr[index];
}

static int uint64_t_cmp(const void *a, const void *b) {
  if (*(uint64_t *)a < *(uint64_t *)b) {
    return -1;
  }
  if (*(uint64_t *)a > *(uint64_t *)b) {
    return 1;
  }
  return 0;
}

/**
 * Return the current CPU time. Good for measuring CPU cycles
 */
static uint64_t get_clock_cpu(void) {
#if defined(__APPLE__)
#if defined(__DEBUG__)
  printf("Using Apple Silicon\n");
#endif
  // on Apple Silicon use high level API
  return mach_absolute_time();
#else
#if defined(__DEBUG__)
  printf("Using x86_64 register RDTSC\n");
#endif
  uint64_t result;
  __asm__ volatile("rdtsc; shlq $32,%%rdx; orq %%rdx,%%rax"
                   : "=a"(result)
                   :
                   : "%rdx");
  return result;
#endif
}

/**
 * Return the current hardware clock in nanosecond. Good for measuring actual
 * time
 */
static uint64_t get_clock_ns(void) {
  struct timespec now;
  clock_gettime(CLOCK_MONOTONIC, &now);
  return now.tv_sec * 1000000000 + now.tv_nsec;
}

/**
 * Return the current real-time clock in microseconds.
 */
static uint64_t get_clock_us(void) {
  struct timespec timer;
  clock_gettime(CLOCK_MONOTONIC, &timer);
  return (timer.tv_sec * 1000000) + (timer.tv_nsec / 1000);
}

/**
 * Compute the medium duration given an array of timestamps
 *
 * THIS FUNCTION IS DESTRUCTIVE! the timestamps array will be mutated
 */
static void println_medium_from_timestamps(char *prefix, uint64_t *tsarr,
                                    size_t tsarr_len) {
  for (size_t i = 0; i < tsarr_len - 1; i++)
    tsarr[i] = tsarr[i + 1] - tsarr[i];
  uint64_t *durs = tsarr;
  uint64_t durslen = tsarr_len - 1;
  qsort(durs, durslen, sizeof(uint64_t), uint64_t_cmp);

  uint64_t medium = 0;
  if (durslen % 2) {
    medium = durs[durslen / 2];
  } else {
    medium = (durs[durslen / 2 - 1] + durs[durslen / 2]) / 2;
  }

  printf("%-32s medium: %16llu\n", prefix, medium);
  printf("%-32s P90   : %16llu\n", "", get_percentile(durs, durslen, 0.90));
  printf("%-32s P99   : %16llu\n", "", get_percentile(durs, durslen, 0.99));
}

static void println_hexstr(uint8_t *bytes, size_t byteslen) {
  printf("0x");
  for (size_t i = 0; i < byteslen; i++) {
    printf("%02X", bytes[i]);
  }
  printf("\n");
}

uint64_t timestamps[SPEED_ROUNDS + 1];

static void benchmark_kem_enc(void) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  crypto_kem_keypair(pk, sk);

  timestamps[0] = get_clock_cpu();
  for (int i = 0; i < SPEED_ROUNDS; i++) {
    crypto_kem_enc(ct, ss, pk);
    timestamps[i + 1] = get_clock_cpu();
  }

  println_medium_from_timestamps("KEM encap", timestamps, SPEED_ROUNDS + 1);
}

static void benchmark_kem_dec(void) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  uint8_t ss_cmp[CRYPTO_BYTES];
  crypto_kem_keypair(pk, sk);
  crypto_kem_enc(ct, ss, pk);

  timestamps[0] = get_clock_cpu();
  for (int i = 0; i < SPEED_ROUNDS; i++) {
    crypto_kem_dec(ss_cmp, ct, sk);
    timestamps[i + 1] = get_clock_cpu();
  }

  println_medium_from_timestamps("KEM decap", timestamps, SPEED_ROUNDS + 1);
}

#if defined(ARCH_AVX)
static void benchmark_cpa_dec(void) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  uint8_t ss_cmp[CRYPTO_BYTES];
  uint8_t e[SYS_N / 8];
  crypto_kem_keypair(pk, sk);
  crypto_kem_enc(ct, ss, pk);

  timestamps[0] = get_clock_cpu();
  for (int i = 0; i < SPEED_ROUNDS; i++) {
    decrypt(e, sk, ct);
    timestamps[i + 1] = get_clock_cpu();
  }

  println_medium_from_timestamps("PKE decap with check", timestamps, SPEED_ROUNDS + 1);

  timestamps[0] = get_clock_cpu();
  for (int i = 0; i < SPEED_ROUNDS; i++) {
    cpa_decrypt(e, sk, ct);
    timestamps[i + 1] = get_clock_cpu();
  }

  println_medium_from_timestamps("PKE decap w/o check", timestamps, SPEED_ROUNDS + 1);
}

static void benchmark_cpa_enc(void) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss[CRYPTO_BYTES];
  uint8_t ss_cmp[CRYPTO_BYTES];
  uint8_t e[SYS_N / 8];
  crypto_kem_keypair(pk, sk);
  crypto_kem_enc(ct, ss, pk);

  timestamps[0] = get_clock_cpu();
  for (int i = 0; i < SPEED_ROUNDS; i++) {
    gen_e(e);
    timestamps[i + 1] = get_clock_cpu();
  }

  println_medium_from_timestamps("Sample error vec", timestamps, SPEED_ROUNDS + 1);

  timestamps[0] = get_clock_cpu();
  for (int i = 0; i < SPEED_ROUNDS; i++) {
    syndrome(ct, pk, e);
    timestamps[i + 1] = get_clock_cpu();
  }

  println_medium_from_timestamps("Synd in Enc", timestamps, SPEED_ROUNDS + 1);
}
#endif

static void benchmark_kem_keypair(int keygen_rounds) {
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];

  timestamps[0] = get_clock_cpu();
  for (int i = 0; i < keygen_rounds; i++) {
    crypto_kem_keypair(pk, sk);
    timestamps[i + 1] = get_clock_cpu();
  }

  println_medium_from_timestamps("KEM keygen", timestamps, keygen_rounds + 1);
}

int main(void) {
#ifdef __DEBUG__
  printf("Speed rounds: %d\n", SPEED_ROUNDS);
#endif
  benchmark_kem_keypair(SPEED_ROUNDS > 10 ? 10 : SPEED_ROUNDS);
  benchmark_kem_enc();
  benchmark_kem_dec();
#ifdef ARCH_AVX
  benchmark_cpa_dec();
  benchmark_cpa_enc();
#endif
  return 0;
}
