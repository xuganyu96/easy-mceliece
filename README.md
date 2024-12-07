# Easy McEliece
**motivation**: I want to work with the sub-routines of classic McEliece's reference implementation (submitted to NIST's PQC standardization project), but my dev environment is MacOS whereas reference implementations, despite striving for maximal portability, are developed on Linux. Classic McEliece's reference implementation also contains a number of dependencies that I do not have on my computer.

This project adapts from the reference implementations: it removes some idiosyncrasy associated with "submitting to NIST" and some dependencies that are not readily available on a fresh MacOS environment.

# API
- specify the macro `MCELIECE_N=<3488|4608|6688|6960|8192>` to indicate the level
- check the Makefile to 

# What changed?
- `nist/rng` is replaced with portable implementation `randombytes.h`
- `crypto_hash.h` is replaced with portable implementation `keccak.h`
- removed all namespacing
- pathing and other minor fixes

# What's next
- [ ] For now none of the "f" variants (the only differece between "f" and normal variants are key generation speed; they are otherwise entirely interoperable) are adapted.
- [ ] There are many duplicate files, maybe we can unify them, but I want to avoid premature optimization
