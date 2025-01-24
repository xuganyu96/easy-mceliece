# Easy McEliece
Classic McEliece's reference and optimized implementations with a few tweaks:
- external dependencies such as OpenSSL (for getting random bytes) and `libkeccak` (seriously what is this?) have been removed

- [ ] Take apart the original implementation so that the OW-CPA subroutines can be exposed
- [ ] Compile into static and/or shared library
- [ ] Perhaps maintain namespacing so that different variants can be run in the same program

# Expose CPA encrypt/decrypt
In the reference implementation, encryption and decryption are implemented non-modularly: `encrypt` calls `gen_e`, where as `decrypt` already contains the integrity check. I want to increase the modularity of the code by separating `gen_e` and integrity check from the one-way functions. I plan to add the following functions:

```c
// add to encrypt.h
/**
* sample an error vector whose Hamming weight is SYS_T
*/
void gen_e(uint8_t *e);
/**
* Compute the syndrome. Calling gen_e then cpa_encrypt is equivalent to calling
* encrypt
*/
void cpa_encrypt(uint8_t *ct, const uint8_t *pk, const uint8_t *e);

// add to decrypt.h
/**
* recover the error from the ciphertext/syndrome, do not do any re-encryption
*/
void cpa_decrypt(uint8_t *e, const uint8_t *sk, const uint8_t *ct);
```

# Correctness and speed test:
```
chmod +x avx.sh ref_vec.sh
./ref_vec.sh
./avx.sh
```

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

On an Amazon Linux machine where:

```bash
$ gcc --version
gcc (GCC) 11.4.1 20230605 (Red Hat 11.4.1-2)
Copyright (C) 2021 Free Software Foundation, Inc.
```

Compiling a single `.S` file works just fine:

```bash
cd avx/mceliece348864
gcc -c -o vec_mul_asm.o vec_mul_asm.S
```

In Makefile, it is possible to specify two rules for `.o` target:

```Makefile
SRC = source1.c source2.c source3.c
ASM = asm1.s asm2.s asm3.s
OBJ = $(SRC:.c=.o) $(SRC:.s=.o)

# use .c as source if available
%.o: %.c
    $(CC) -c -o $@ $^

# use .s as source if available
%.o: %.s
    $(CC) -c -o $@ $^

libstatic.a: $(OBJ)
    ar rcs $@ $^
```

# Clangd
```yaml
CompilerFlags:
   Add: [-DARCH_REF, -DMCELIECE_N=3488] 
```