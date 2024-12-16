#include "stopwatch.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef __APPLE__
#include <mach/mach_time.h>
#endif

static struct timespec rt_clock;

/**
 * Estimate a percentile for the given array
 */
static uint64_t get_percentile_from_sorted_arr(const uint64_t *sorted_arr,
                                               size_t arrlen,
                                               double percentile) {
  int index = (int)ceil(percentile * (arrlen - 1));
  return sorted_arr[index];
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
 * Initialize a stopwatch. Set all timestamps to and length to 0.
 */
void stopwatch_init(stopwatch_t *stopwatch) {
  for (int i = 0; i < STOPWATCH_CAPACITY; i++) {
    stopwatch->timestamps[i] = 0;
  }
  stopwatch->len = 0;
}

/**
 * Record a lap time. Return 0 upon success, or non-zero on error.
 */
int stopwatch_lap(stopwatch_t *stopwatch, timestamp_t (*get_clock)()) {
  timestamp_t now = get_clock();
  if (stopwatch->len >= STOPWATCH_CAPACITY) {
#ifdef __DEBUG__
    fprintf(stderr, "Stopwatch overflowed\n");
#endif
    return 1;
  }
  stopwatch->timestamps[stopwatch->len] = now;
  stopwatch->len++;
  return 0;
}

/**
 * Dump timestamps to a file, where each timestamp is a new line. Return 0 upon
 * success.
 */
int stopwatch_dump(FILE *file_d, const stopwatch_t *stopwatch) {
  int fail = 0;
  for (size_t loc = 0; loc < stopwatch->len; loc++) {
    fail |= fprintf(file_d, "%llu\n", stopwatch->timestamps[loc]);
  }
  return fail;
}

/**
 * Compute the lap times and sort in increasing order. Return 0 upon success.
 */
int stopwatch_finalize(laps_t *laps, const stopwatch_t *stopwatch) {
  laps->len = 0;
  if (stopwatch->len < 2) {
#ifdef __DEBUG__
    fprintf(stderr, "Need at least 2 timestamps to compute lap times\n");
#endif
    return 1;
  }
  for (size_t lap_loc = 0; lap_loc < stopwatch->len - 1; lap_loc++) {
    timestamp_t stop = stopwatch->timestamps[lap_loc + 1];
    timestamp_t start = stopwatch->timestamps[lap_loc];
    if (stop < start) {
#ifdef __DEBUG__
      fprintf(stderr, "Timestamps are not monotonic\n");
#endif
      return 1;
    }
    laps->laptimes[lap_loc] = stop - start;
    laps->len++;
  }

  qsort(laps->laptimes, laps->len, sizeof(timestamp_t), uint64_t_cmp);
  return 0;
}

timestamp_t laps_percentile(const laps_t *laps, double percentile) {
  return get_percentile_from_sorted_arr(laps->laptimes, laps->len, percentile);
}

/**
 * Return the medium lap time. Assume lap times are not empty.
 */
timestamp_t laps_medium(const laps_t *laps) {
  timestamp_t medium;
  if (laps->len % 2) {
    medium = laps->laptimes[laps->len / 2];
  } else {
    medium =
        (laps->laptimes[laps->len / 2 - 1] + laps->laptimes[laps->len / 2]) / 2;
  }
  return medium;
}

/**
 * Print the prefix, then print medium, P90, and P99
 */
void stopwatch_pretty_statistics(char *prefix, stopwatch_t *stopwatch) {
  printf("%s\n", prefix);
  laps_t result;
  stopwatch_finalize(&result, stopwatch);

  printf("%-12s: %20llu\n", "Medium", laps_medium(&result));
  printf("%-12s: %20llu\n", "P90", laps_percentile(&result, 0.9));
  printf("%-12s: %20llu\n", "P99", laps_percentile(&result, 0.99));
}

timestamp_t get_cpu_clock() {
#ifdef __APPLE__
  return mach_absolute_time();
#else
  return clock();
#endif
}

timestamp_t get_monotonic_us() {
  clock_gettime(CLOCK_MONOTONIC, &rt_clock);
  return rt_clock.tv_sec * 1000000 + rt_clock.tv_nsec / 1000;
}
