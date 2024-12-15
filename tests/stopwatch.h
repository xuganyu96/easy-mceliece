/**
 * Performance benchmarking utilities
 */
#ifndef STOPWATCH_H
#define STOPWATCH_H

#include <stdint.h>
#include <stdio.h>

#ifndef SPEED_ROUNDS
#define SPEED_ROUNDS 10000
#endif
#define STOPWATCH_CAPACITY (SPEED_ROUNDS + 1)
#define timestamp_t uint64_t

typedef struct stopwatch_t {
  timestamp_t timestamps[STOPWATCH_CAPACITY];
  size_t len;
} stopwatch_t;

typedef struct laps_t {
  timestamp_t laptimes[STOPWATCH_CAPACITY - 1];
  size_t len;
} laps_t;

void stopwatch_init(stopwatch_t *stopwatch);
int stopwatch_lap(stopwatch_t *stopwatch, timestamp_t (*get_clock)());
int stopwatch_dump(FILE *file_d, const stopwatch_t *stopwatch);
void stopwatch_pretty_statistics(char *prefix, stopwatch_t *stopwatch);
// NOTES: consider making it private?
int stopwatch_finalize(laps_t *laps, const stopwatch_t *stopwatch);
timestamp_t laps_percentile(const laps_t *laps, double percentile);
timestamp_t laps_medium(const laps_t *laps);

timestamp_t get_cpu_clock();
timestamp_t get_monotonic_ns();
timestamp_t get_monotonic_us();

#endif
