#include "tests/stopwatch.h"
#include <mach/mach_time.h>
#include <stdio.h>

void busybox(uint64_t ticks) {
  uint64_t prev = 1;
  uint64_t next = 1;
  uint64_t tmp;

  for (uint64_t i = 0; i < ticks; i++) {
    tmp = prev + next;
    prev = next;
    next = tmp;
  }
  fprintf(stderr, "%llu\n", next);
}

int main(void) {
  stopwatch_t benchmarker;
  stopwatch_init(&benchmarker);
  stopwatch_lap(&benchmarker, get_cpu_clock);
  for (int round = 0; round < STOPWATCH_CAPACITY; round++) {
    busybox(10000);
    stopwatch_lap(&benchmarker, get_cpu_clock);
  }

  stopwatch_pretty_statistics("Busybox", &benchmarker);
  return 0;
}
