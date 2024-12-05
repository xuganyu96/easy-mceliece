# Easy McEliece
**motivation**: I want to work with the sub-routines of classic McEliece's reference implementation (submitted to NIST's PQC standardization project), but my dev environment is MacOS whereas reference implementations, despite striving for maximal portability, are developed on Linux. Classic McEliece's reference implementation also contains a number of dependencies that I do not have on my computer.

This project adapts from the reference implementations: it removes some idiosyncrasy associated with "submitting to NIST" and some dependencies that are not readily available on a fresh MacOS environment.

# API

# What changed?
- removed all namespacing
- removed `crypto_hash.h`'s dependency on `libkeccak`; instead, a portable implementation is adapted from [Kyber's reference implementation](https://github.com/pq-crystals/kyber/blob/main/ref/fips202.c), which is itself adapted from TweetFips202
- removed `crypto_kem.h`, `crypto_kem_mcelieceXXXXXXX.h`, and `kat_kem.c`
- added `#include "gf.h"` to `bm.h`
- `nist/rng` is removed because it depends on OpenSSL; `randombytes.h` is implemented using a portable implementation from [here](https://github.com/pq-crystals/kyber/blob/main/ref/randombytes.c)

# What's next
For now none of the "f" variants (the only differece between "f" and normal variants are key generation speed; they are otherwise entirely interoperable) are adapted.
