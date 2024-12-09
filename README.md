When building, include all `easy-mceliece` C files. Use the following flags to control the variant being compiled:
- `MCELIECE_N=<3488|4608|6688|6960|8192>`
- define the macro `FASTKEYGEN` to use the fast

# Easy McEliece
**motivation**: I want to work with the sub-routines of classic McEliece's reference implementation (submitted to NIST's PQC standardization project), but my dev environment is MacOS whereas reference implementations, despite striving for maximal portability, are developed on Linux. Classic McEliece's reference implementation also contains a number of dependencies that I do not have on my computer.

This project adapts from the reference implementations: it removes some idiosyncrasy associated with "submitting to NIST" and some dependencies that are not readily available on a fresh MacOS environment.

# What's next
- [ ] Incorporate code from `vec`, `sse`, and `avx2` implementations

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

| Binary Name                       | Keypair Time | Encap Time | Decap Time |
|:--|--:|--:|--:|
| test_mceliece348864_speed         | 1571116      | 459        | 464351     |
| test_mceliece348864f_speed        | 778952       | 459        | 465089     |
| test_mceliece460896_speed         | 3717257      | 781        | 1120455    |
| test_mceliece460896f_speed        | 2209614      | 715        | 1118472    |
| test_mceliece6688128_speed        | 10669633     | 1623       | 2153795    |
| test_mceliece6688128f_speed       | 4116968      | 1558       | 2154290    |
| test_mceliece6960119_speed        | 10012902     | 15264      | 2086029    |
| test_mceliece6960119f_speed       | 3941851      | 15631      | 2084772    |
| test_mceliece8192128_speed        | 14350639     | 1498       | 2636440    |
| test_mceliece8192128f_speed       | 4503919      | 1556       | 2637498    |

