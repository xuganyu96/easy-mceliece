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

# Notes on performance
According to the [official website](https://classic.mceliece.org/impl.html), McEliece's encapsulation and decapsulation times (measured in Haswell CPU cycles) are as follows:

|variant|keygen|enc|dec|
|:--|:--|:--|:--|
|348864f|37721176|34748|132554|
|348864|53245048|34256|132541|
|460896f|122281345|77010|266197|
|460896|173340957|75487|266055|
|6688128f|288804317|128778|315443|
|6688128|461261728|128984|315809|
|6960119f|247469509|135686|290003|
|6960119|334125327|138522|290075|
|8192128f|316124280|146142|314719|
|8192128|483327051|146800|314483|

The ratio between decapsulation cost and encapsulation cost ranges between 3.48 and 1.98.

**However, the benchmark data on my laptop have very different shape:**

| Binary Name                   | Keypair Time | Encryption Time | Decryption Time |
|-------------------------------|--------------|-----------------|-----------------|
| test_mceliece348864_speed     | 1499963      | 475             | 464340          |
| test_mceliece460896_speed     | 4523607      | 771             | 1118701         |
| test_mceliece6688128_speed    | 11455592     | 1566            | 2187536         |
| test_mceliece6960119_speed    | 9783005      | 15428           | 2084421         |
| test_mceliece8192128_speed    | 12189563     | 1518            | 2635599         |
