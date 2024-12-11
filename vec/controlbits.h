/**
 * Nassimi-Sahni algorithm
 * See David Nassimi, Sartaj Sahni "Parallel algorithms to set up the Benes
 * permutation network"
 */
#ifndef CONTROLBITS_H
#define CONTROLBITS_H

#include <inttypes.h>

extern void controlbitsfrompermutation(unsigned char *, const int16_t *,
                                       long long, long long);

#endif
