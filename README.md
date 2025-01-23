# Easy McEliece
Classic McEliece's reference and optimized implementations with a few tweaks:
- external dependencies such as OpenSSL (for getting random bytes) and `libkeccak` (seriously what is this?) have been removed

- [ ] Compile `ref` into a shared library
- [ ] Take apart the original implementation so that the OW-CPA subroutines can be exposed
- [ ] Compile into static and/or shared library
- [ ] Perhaps maintain namespacing so that different variants can be run in the same program

# Compile `ref/mceliece348864` into a shared library
`ref/mceliece348864` contains only C source code and header files, so compiling it into a static and/or shared library is relatively straightforward:
- compile all `.c` files into `.o` object files
- use `ar` to combine individual object files into a single archive containing all symbols:
    - use `r` flag to insert object files into the archive and replace existing symbol
    - use `c` flag to create the archive if doesn't already exist
    - use `s` flag to write an index to the archive (**what does this mean?**)
- use `$(CC)` with `-shared` flag to compile individual object files into a shared library
- side note: `$^` means all dependencies, `$<` means first dependency, `$@` means the target; if the target is not a file, then it should be listed under `.PHONY`

Static libraries can be directed used as an input alongside other `.c` source files:

```Makefile
$(CC) test_correctness.c libmceliece348864ref.a -o target/test_correctness
```

# Compile `avx/mceliece348864` on Apple Silicon
There are some toolchain-specific assembly instructions that are not trivial to overcome using `arch -x86_64`. Instead we will have to use a real x86_64 machine with GNU toolchain to compile.

