# Makefile for compiling ref/mceliece348864 into a static library (and a shared library)

SOURCES = ref/mceliece348864/benes.c \
	ref/mceliece348864/bm.c \
	ref/mceliece348864/controlbits.c \
	ref/mceliece348864/decrypt.c \
	ref/mceliece348864/encrypt.c \
	ref/mceliece348864/gf.c \
	ref/mceliece348864/keccak.c \
	ref/mceliece348864/operations.c \
	ref/mceliece348864/pk_gen.c \
	ref/mceliece348864/randombytes.c \
	ref/mceliece348864/root.c \
	ref/mceliece348864/sk_gen.c \
	ref/mceliece348864/synd.c \
	ref/mceliece348864/transpose.c \
	ref/mceliece348864/util.c

HEADERS = ref/mceliece348864/api.h \
	ref/mceliece348864/benes.h \
	ref/mceliece348864/bm.h \
	ref/mceliece348864/controlbits.h \
	ref/mceliece348864/crypto_hash.h \
	ref/mceliece348864/crypto_kem.h \
	ref/mceliece348864/crypto_kem_mceliece348864.h \
	ref/mceliece348864/decrypt.h \
	ref/mceliece348864/encrypt.h \
	ref/mceliece348864/gf.h \
	ref/mceliece348864/int32_sort.h \
	ref/mceliece348864/keccak.h \
	ref/mceliece348864/operations.h \
	ref/mceliece348864/params.h \
	ref/mceliece348864/pk_gen.h \
	ref/mceliece348864/randombytes.h \
	ref/mceliece348864/root.h \
	ref/mceliece348864/sk_gen.h \
	ref/mceliece348864/synd.h \
	ref/mceliece348864/transpose.h \
	ref/mceliece348864/uint64_sort.h \
	ref/mceliece348864/util.h

OBJECTS = $(SOURCES:.c=.o)

STATIC_LIB = libmceliece348864ref.a
SHARED_LIB = libmceliece348864ref.so

.PHONY: all clean

all: $(STATIC_LIB) $(SHARED_LIB)

$(STATIC_LIB): $(OBJECTS)
	ar rcs $@ $^

$(SHARED_LIB): $(OBJECTS)
	$(CC) -shared -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

target/test_correctness: test_correctness.c $(SHARED_LIB)
	$(CC) $^ -o $@

target/test_speed: test_speed.c $(SHARED_LIB)
	$(CC) $^ -o $@

clean:
	$(RM) $(OBJECTS) $(STATIC_LIB) $(SHARED_LIB)
	$(RM) target/*
