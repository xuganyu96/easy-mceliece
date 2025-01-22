# Makefile for compiling ref/mceliece348864 into a static library (and a shared library)
# Usage:
# make -f ref.Makefile all
# make -f ref.Makefile clean
# make -f ref.Makefile target/test_correctness
# make -f ref.Makefile target/test_speed

MCELIECE348864REF_SOURCES = ref/mceliece348864/benes.c \
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
MCELIECE348864REF_HEADERS = ref/mceliece348864/api.h \
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
MCELIECE348864REF_OBJECTS = $(MCELIECE348864REF_SOURCES:.c=.o)
MCELIECE348864REF_STATIC_LIB = target/libmceliece348864ref.a
MCELIECE348864REF_SHARED_LIB = target/libmceliece348864ref.so

MCELIECE348864fREF_SOURCES = ref/mceliece348864f/benes.c \
	ref/mceliece348864f/bm.c \
	ref/mceliece348864f/controlbits.c \
	ref/mceliece348864f/decrypt.c \
	ref/mceliece348864f/encrypt.c \
	ref/mceliece348864f/gf.c \
	ref/mceliece348864f/keccak.c \
	ref/mceliece348864f/operations.c \
	ref/mceliece348864f/pk_gen.c \
	ref/mceliece348864f/randombytes.c \
	ref/mceliece348864f/root.c \
	ref/mceliece348864f/sk_gen.c \
	ref/mceliece348864f/synd.c \
	ref/mceliece348864f/transpose.c \
	ref/mceliece348864f/util.c
MCELIECE348864fREF_HEADERS = ref/mceliece348864f/api.h \
	ref/mceliece348864f/benes.h \
	ref/mceliece348864f/bm.h \
	ref/mceliece348864f/controlbits.h \
	ref/mceliece348864f/crypto_hash.h \
	ref/mceliece348864f/crypto_kem.h \
	ref/mceliece348864f/crypto_kem_mceliece348864f.h \
	ref/mceliece348864f/decrypt.h \
	ref/mceliece348864f/encrypt.h \
	ref/mceliece348864f/gf.h \
	ref/mceliece348864f/int32_sort.h \
	ref/mceliece348864f/keccak.h \
	ref/mceliece348864f/operations.h \
	ref/mceliece348864f/params.h \
	ref/mceliece348864f/pk_gen.h \
	ref/mceliece348864f/randombytes.h \
	ref/mceliece348864f/root.h \
	ref/mceliece348864f/sk_gen.h \
	ref/mceliece348864f/synd.h \
	ref/mceliece348864f/transpose.h \
	ref/mceliece348864f/uint64_sort.h \
	ref/mceliece348864f/util.h
MCELIECE348864fREF_OBJECTS = $(MCELIECE348864fREF_SOURCES:.c=.o)
MCELIECE348864fREF_STATIC_LIB = target/libmceliece348864fref.a
MCELIECE348864fREF_SHARED_LIB = target/libmceliece348864fref.so

MCELIECE460896REF_SOURCES = ref/mceliece460896/benes.c \
	ref/mceliece460896/bm.c \
	ref/mceliece460896/controlbits.c \
	ref/mceliece460896/decrypt.c \
	ref/mceliece460896/encrypt.c \
	ref/mceliece460896/gf.c \
	ref/mceliece460896/keccak.c \
	ref/mceliece460896/operations.c \
	ref/mceliece460896/pk_gen.c \
	ref/mceliece460896/randombytes.c \
	ref/mceliece460896/root.c \
	ref/mceliece460896/sk_gen.c \
	ref/mceliece460896/synd.c \
	ref/mceliece460896/transpose.c \
	ref/mceliece460896/util.c
MCELIECE460896REF_HEADERS = ref/mceliece460896/api.h \
	ref/mceliece460896/benes.h \
	ref/mceliece460896/bm.h \
	ref/mceliece460896/controlbits.h \
	ref/mceliece460896/crypto_hash.h \
	ref/mceliece460896/crypto_kem.h \
	ref/mceliece460896/crypto_kem_mceliece460896.h \
	ref/mceliece460896/decrypt.h \
	ref/mceliece460896/encrypt.h \
	ref/mceliece460896/gf.h \
	ref/mceliece460896/int32_sort.h \
	ref/mceliece460896/keccak.h \
	ref/mceliece460896/operations.h \
	ref/mceliece460896/params.h \
	ref/mceliece460896/pk_gen.h \
	ref/mceliece460896/randombytes.h \
	ref/mceliece460896/root.h \
	ref/mceliece460896/sk_gen.h \
	ref/mceliece460896/synd.h \
	ref/mceliece460896/transpose.h \
	ref/mceliece460896/uint64_sort.h \
	ref/mceliece460896/util.h
MCELIECE460896REF_OBJECTS = $(MCELIECE460896REF_SOURCES:.c=.o)
MCELIECE460896REF_STATIC_LIB = target/libmceliece460896ref.a
MCELIECE460896REF_SHARED_LIB = target/libmceliece460896ref.so

MCELIECE460896fREF_SOURCES = ref/mceliece460896f/benes.c \
	ref/mceliece460896f/bm.c \
	ref/mceliece460896f/controlbits.c \
	ref/mceliece460896f/decrypt.c \
	ref/mceliece460896f/encrypt.c \
	ref/mceliece460896f/gf.c \
	ref/mceliece460896f/keccak.c \
	ref/mceliece460896f/operations.c \
	ref/mceliece460896f/pk_gen.c \
	ref/mceliece460896f/randombytes.c \
	ref/mceliece460896f/root.c \
	ref/mceliece460896f/sk_gen.c \
	ref/mceliece460896f/synd.c \
	ref/mceliece460896f/transpose.c \
	ref/mceliece460896f/util.c
MCELIECE460896fREF_HEADERS = ref/mceliece460896f/api.h \
	ref/mceliece460896f/benes.h \
	ref/mceliece460896f/bm.h \
	ref/mceliece460896f/controlbits.h \
	ref/mceliece460896f/crypto_hash.h \
	ref/mceliece460896f/crypto_kem.h \
	ref/mceliece460896f/crypto_kem_mceliece460896f.h \
	ref/mceliece460896f/decrypt.h \
	ref/mceliece460896f/encrypt.h \
	ref/mceliece460896f/gf.h \
	ref/mceliece460896f/int32_sort.h \
	ref/mceliece460896f/keccak.h \
	ref/mceliece460896f/operations.h \
	ref/mceliece460896f/params.h \
	ref/mceliece460896f/pk_gen.h \
	ref/mceliece460896f/randombytes.h \
	ref/mceliece460896f/root.h \
	ref/mceliece460896f/sk_gen.h \
	ref/mceliece460896f/synd.h \
	ref/mceliece460896f/transpose.h \
	ref/mceliece460896f/uint64_sort.h \
	ref/mceliece460896f/util.h
MCELIECE460896fREF_OBJECTS = $(MCELIECE460896fREF_SOURCES:.c=.o)
MCELIECE460896fREF_STATIC_LIB = target/libmceliece460896fref.a
MCELIECE460896fREF_SHARED_LIB = target/libmceliece460896fref.so

MCELIECE6688128REF_SOURCES = ref/mceliece6688128/benes.c \
	ref/mceliece6688128/bm.c \
	ref/mceliece6688128/controlbits.c \
	ref/mceliece6688128/decrypt.c \
	ref/mceliece6688128/encrypt.c \
	ref/mceliece6688128/gf.c \
	ref/mceliece6688128/keccak.c \
	ref/mceliece6688128/operations.c \
	ref/mceliece6688128/pk_gen.c \
	ref/mceliece6688128/randombytes.c \
	ref/mceliece6688128/root.c \
	ref/mceliece6688128/sk_gen.c \
	ref/mceliece6688128/synd.c \
	ref/mceliece6688128/transpose.c \
	ref/mceliece6688128/util.c
MCELIECE6688128REF_HEADERS = ref/mceliece6688128/api.h \
	ref/mceliece6688128/benes.h \
	ref/mceliece6688128/bm.h \
	ref/mceliece6688128/controlbits.h \
	ref/mceliece6688128/crypto_hash.h \
	ref/mceliece6688128/crypto_kem.h \
	ref/mceliece6688128/crypto_kem_mceliece6688128.h \
	ref/mceliece6688128/decrypt.h \
	ref/mceliece6688128/encrypt.h \
	ref/mceliece6688128/gf.h \
	ref/mceliece6688128/int32_sort.h \
	ref/mceliece6688128/keccak.h \
	ref/mceliece6688128/operations.h \
	ref/mceliece6688128/params.h \
	ref/mceliece6688128/pk_gen.h \
	ref/mceliece6688128/randombytes.h \
	ref/mceliece6688128/root.h \
	ref/mceliece6688128/sk_gen.h \
	ref/mceliece6688128/synd.h \
	ref/mceliece6688128/transpose.h \
	ref/mceliece6688128/uint64_sort.h \
	ref/mceliece6688128/util.h
MCELIECE6688128REF_OBJECTS = $(MCELIECE6688128REF_SOURCES:.c=.o)
MCELIECE6688128REF_STATIC_LIB = target/libmceliece6688128ref.a
MCELIECE6688128REF_SHARED_LIB = target/libmceliece6688128ref.so

MCELIECE6688128fREF_SOURCES = ref/mceliece6688128f/benes.c \
	ref/mceliece6688128f/bm.c \
	ref/mceliece6688128f/controlbits.c \
	ref/mceliece6688128f/decrypt.c \
	ref/mceliece6688128f/encrypt.c \
	ref/mceliece6688128f/gf.c \
	ref/mceliece6688128f/keccak.c \
	ref/mceliece6688128f/operations.c \
	ref/mceliece6688128f/pk_gen.c \
	ref/mceliece6688128f/randombytes.c \
	ref/mceliece6688128f/root.c \
	ref/mceliece6688128f/sk_gen.c \
	ref/mceliece6688128f/synd.c \
	ref/mceliece6688128f/transpose.c \
	ref/mceliece6688128f/util.c
MCELIECE6688128fREF_HEADERS = ref/mceliece6688128f/api.h \
	ref/mceliece6688128f/benes.h \
	ref/mceliece6688128f/bm.h \
	ref/mceliece6688128f/controlbits.h \
	ref/mceliece6688128f/crypto_hash.h \
	ref/mceliece6688128f/crypto_kem.h \
	ref/mceliece6688128f/crypto_kem_mceliece6688128f.h \
	ref/mceliece6688128f/decrypt.h \
	ref/mceliece6688128f/encrypt.h \
	ref/mceliece6688128f/gf.h \
	ref/mceliece6688128f/int32_sort.h \
	ref/mceliece6688128f/keccak.h \
	ref/mceliece6688128f/operations.h \
	ref/mceliece6688128f/params.h \
	ref/mceliece6688128f/pk_gen.h \
	ref/mceliece6688128f/randombytes.h \
	ref/mceliece6688128f/root.h \
	ref/mceliece6688128f/sk_gen.h \
	ref/mceliece6688128f/synd.h \
	ref/mceliece6688128f/transpose.h \
	ref/mceliece6688128f/uint64_sort.h \
	ref/mceliece6688128f/util.h
MCELIECE6688128fREF_OBJECTS = $(MCELIECE6688128fREF_SOURCES:.c=.o)
MCELIECE6688128fREF_STATIC_LIB = target/libmceliece6688128fref.a
MCELIECE6688128fREF_SHARED_LIB = target/libmceliece6688128fref.so

MCELIECE6960119REF_SOURCES = ref/mceliece6960119/benes.c \
	ref/mceliece6960119/bm.c \
	ref/mceliece6960119/controlbits.c \
	ref/mceliece6960119/decrypt.c \
	ref/mceliece6960119/encrypt.c \
	ref/mceliece6960119/gf.c \
	ref/mceliece6960119/keccak.c \
	ref/mceliece6960119/operations.c \
	ref/mceliece6960119/pk_gen.c \
	ref/mceliece6960119/randombytes.c \
	ref/mceliece6960119/root.c \
	ref/mceliece6960119/sk_gen.c \
	ref/mceliece6960119/synd.c \
	ref/mceliece6960119/transpose.c \
	ref/mceliece6960119/util.c
MCELIECE6960119REF_HEADERS = ref/mceliece6960119/api.h \
	ref/mceliece6960119/benes.h \
	ref/mceliece6960119/bm.h \
	ref/mceliece6960119/controlbits.h \
	ref/mceliece6960119/crypto_hash.h \
	ref/mceliece6960119/crypto_kem.h \
	ref/mceliece6960119/crypto_kem_mceliece6960119.h \
	ref/mceliece6960119/decrypt.h \
	ref/mceliece6960119/encrypt.h \
	ref/mceliece6960119/gf.h \
	ref/mceliece6960119/int32_sort.h \
	ref/mceliece6960119/keccak.h \
	ref/mceliece6960119/operations.h \
	ref/mceliece6960119/params.h \
	ref/mceliece6960119/pk_gen.h \
	ref/mceliece6960119/randombytes.h \
	ref/mceliece6960119/root.h \
	ref/mceliece6960119/sk_gen.h \
	ref/mceliece6960119/synd.h \
	ref/mceliece6960119/transpose.h \
	ref/mceliece6960119/uint64_sort.h \
	ref/mceliece6960119/util.h
MCELIECE6960119REF_OBJECTS = $(MCELIECE6960119REF_SOURCES:.c=.o)
MCELIECE6960119REF_STATIC_LIB = target/libmceliece6960119ref.a
MCELIECE6960119REF_SHARED_LIB = target/libmceliece6960119ref.so

MCELIECE6960119fREF_SOURCES = ref/mceliece6960119f/benes.c \
	ref/mceliece6960119f/bm.c \
	ref/mceliece6960119f/controlbits.c \
	ref/mceliece6960119f/decrypt.c \
	ref/mceliece6960119f/encrypt.c \
	ref/mceliece6960119f/gf.c \
	ref/mceliece6960119f/keccak.c \
	ref/mceliece6960119f/operations.c \
	ref/mceliece6960119f/pk_gen.c \
	ref/mceliece6960119f/randombytes.c \
	ref/mceliece6960119f/root.c \
	ref/mceliece6960119f/sk_gen.c \
	ref/mceliece6960119f/synd.c \
	ref/mceliece6960119f/transpose.c \
	ref/mceliece6960119f/util.c
MCELIECE6960119fREF_HEADERS = ref/mceliece6960119f/api.h \
	ref/mceliece6960119f/benes.h \
	ref/mceliece6960119f/bm.h \
	ref/mceliece6960119f/controlbits.h \
	ref/mceliece6960119f/crypto_hash.h \
	ref/mceliece6960119f/crypto_kem.h \
	ref/mceliece6960119f/crypto_kem_mceliece6960119f.h \
	ref/mceliece6960119f/decrypt.h \
	ref/mceliece6960119f/encrypt.h \
	ref/mceliece6960119f/gf.h \
	ref/mceliece6960119f/int32_sort.h \
	ref/mceliece6960119f/keccak.h \
	ref/mceliece6960119f/operations.h \
	ref/mceliece6960119f/params.h \
	ref/mceliece6960119f/pk_gen.h \
	ref/mceliece6960119f/randombytes.h \
	ref/mceliece6960119f/root.h \
	ref/mceliece6960119f/sk_gen.h \
	ref/mceliece6960119f/synd.h \
	ref/mceliece6960119f/transpose.h \
	ref/mceliece6960119f/uint64_sort.h \
	ref/mceliece6960119f/util.h
MCELIECE6960119fREF_OBJECTS = $(MCELIECE6960119fREF_SOURCES:.c=.o)
MCELIECE6960119fREF_STATIC_LIB = target/libmceliece6960119fref.a
MCELIECE6960119fREF_SHARED_LIB = target/libmceliece6960119fref.so

MCELIECE8192128REF_SOURCES = ref/mceliece8192128/benes.c \
	ref/mceliece8192128/bm.c \
	ref/mceliece8192128/controlbits.c \
	ref/mceliece8192128/decrypt.c \
	ref/mceliece8192128/encrypt.c \
	ref/mceliece8192128/gf.c \
	ref/mceliece8192128/keccak.c \
	ref/mceliece8192128/operations.c \
	ref/mceliece8192128/pk_gen.c \
	ref/mceliece8192128/randombytes.c \
	ref/mceliece8192128/root.c \
	ref/mceliece8192128/sk_gen.c \
	ref/mceliece8192128/synd.c \
	ref/mceliece8192128/transpose.c \
	ref/mceliece8192128/util.c
MCELIECE8192128REF_HEADERS = ref/mceliece8192128/api.h \
	ref/mceliece8192128/benes.h \
	ref/mceliece8192128/bm.h \
	ref/mceliece8192128/controlbits.h \
	ref/mceliece8192128/crypto_hash.h \
	ref/mceliece8192128/crypto_kem.h \
	ref/mceliece8192128/crypto_kem_mceliece8192128.h \
	ref/mceliece8192128/decrypt.h \
	ref/mceliece8192128/encrypt.h \
	ref/mceliece8192128/gf.h \
	ref/mceliece8192128/int32_sort.h \
	ref/mceliece8192128/keccak.h \
	ref/mceliece8192128/operations.h \
	ref/mceliece8192128/params.h \
	ref/mceliece8192128/pk_gen.h \
	ref/mceliece8192128/randombytes.h \
	ref/mceliece8192128/root.h \
	ref/mceliece8192128/sk_gen.h \
	ref/mceliece8192128/synd.h \
	ref/mceliece8192128/transpose.h \
	ref/mceliece8192128/uint64_sort.h \
	ref/mceliece8192128/util.h
MCELIECE8192128REF_OBJECTS = $(MCELIECE8192128REF_SOURCES:.c=.o)
MCELIECE8192128REF_STATIC_LIB = target/libmceliece8192128ref.a
MCELIECE8192128REF_SHARED_LIB = target/libmceliece8192128ref.so

MCELIECE8192128fREF_SOURCES = ref/mceliece8192128f/benes.c \
	ref/mceliece8192128f/bm.c \
	ref/mceliece8192128f/controlbits.c \
	ref/mceliece8192128f/decrypt.c \
	ref/mceliece8192128f/encrypt.c \
	ref/mceliece8192128f/gf.c \
	ref/mceliece8192128f/keccak.c \
	ref/mceliece8192128f/operations.c \
	ref/mceliece8192128f/pk_gen.c \
	ref/mceliece8192128f/randombytes.c \
	ref/mceliece8192128f/root.c \
	ref/mceliece8192128f/sk_gen.c \
	ref/mceliece8192128f/synd.c \
	ref/mceliece8192128f/transpose.c \
	ref/mceliece8192128f/util.c
MCELIECE8192128fREF_HEADERS = ref/mceliece8192128f/api.h \
	ref/mceliece8192128f/benes.h \
	ref/mceliece8192128f/bm.h \
	ref/mceliece8192128f/controlbits.h \
	ref/mceliece8192128f/crypto_hash.h \
	ref/mceliece8192128f/crypto_kem.h \
	ref/mceliece8192128f/crypto_kem_mceliece8192128f.h \
	ref/mceliece8192128f/decrypt.h \
	ref/mceliece8192128f/encrypt.h \
	ref/mceliece8192128f/gf.h \
	ref/mceliece8192128f/int32_sort.h \
	ref/mceliece8192128f/keccak.h \
	ref/mceliece8192128f/operations.h \
	ref/mceliece8192128f/params.h \
	ref/mceliece8192128f/pk_gen.h \
	ref/mceliece8192128f/randombytes.h \
	ref/mceliece8192128f/root.h \
	ref/mceliece8192128f/sk_gen.h \
	ref/mceliece8192128f/synd.h \
	ref/mceliece8192128f/transpose.h \
	ref/mceliece8192128f/uint64_sort.h \
	ref/mceliece8192128f/util.h
MCELIECE8192128fREF_OBJECTS = $(MCELIECE8192128fREF_SOURCES:.c=.o)
MCELIECE8192128fREF_STATIC_LIB = target/libmceliece8192128fref.a
MCELIECE8192128fREF_SHARED_LIB = target/libmceliece8192128fref.so

.PHONY: all clean

all: \
	$(MCELIECE348864REF_STATIC_LIB) \
	$(MCELIECE348864fREF_STATIC_LIB) \
	$(MCELIECE460896REF_STATIC_LIB) \
	$(MCELIECE460896fREF_STATIC_LIB) \
	$(MCELIECE6688128REF_STATIC_LIB) \
	$(MCELIECE6688128fREF_STATIC_LIB) \
	$(MCELIECE6960119REF_STATIC_LIB) \
	$(MCELIECE6960119fREF_STATIC_LIB) \
	$(MCELIECE8192128REF_STATIC_LIB) \
	$(MCELIECE8192128fREF_STATIC_LIB) \
	$(MCELIECE348864REF_SHARED_LIB) \
	$(MCELIECE348864fREF_SHARED_LIB) \
	$(MCELIECE460896REF_SHARED_LIB) \
	$(MCELIECE460896fREF_SHARED_LIB) \
	$(MCELIECE6688128REF_SHARED_LIB) \
	$(MCELIECE6688128fREF_SHARED_LIB) \
	$(MCELIECE6960119REF_SHARED_LIB) \
	$(MCELIECE6960119fREF_SHARED_LIB) \
	$(MCELIECE8192128REF_SHARED_LIB) \
	$(MCELIECE8192128fREF_SHARED_LIB)

$(MCELIECE348864REF_STATIC_LIB): $(MCELIECE348864REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE348864REF_SHARED_LIB): $(MCELIECE348864REF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE348864fREF_STATIC_LIB): $(MCELIECE348864fREF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE348864fREF_SHARED_LIB): $(MCELIECE348864fREF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE460896REF_STATIC_LIB): $(MCELIECE348864REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE460896REF_SHARED_LIB): $(MCELIECE348864REF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE460896fREF_STATIC_LIB): $(MCELIECE460896fREF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE460896fREF_SHARED_LIB): $(MCELIECE460896fREF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE6688128REF_STATIC_LIB): $(MCELIECE6688128REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6688128REF_SHARED_LIB): $(MCELIECE6688128REF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE6688128fREF_STATIC_LIB): $(MCELIECE6688128fREF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6688128fREF_SHARED_LIB): $(MCELIECE6688128fREF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE6960119REF_STATIC_LIB): $(MCELIECE6960119REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6960119REF_SHARED_LIB): $(MCELIECE6960119REF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE6960119fREF_STATIC_LIB): $(MCELIECE6960119fREF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6960119fREF_SHARED_LIB): $(MCELIECE6960119fREF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE8192128REF_STATIC_LIB): $(MCELIECE8192128REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE8192128REF_SHARED_LIB): $(MCELIECE8192128REF_OBJECTS)
	$(CC) -shared -o $@ $^

$(MCELIECE8192128fREF_STATIC_LIB): $(MCELIECE8192128fREF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE8192128fREF_SHARED_LIB): $(MCELIECE8192128fREF_OBJECTS)
	$(CC) -shared -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

target/test_correctness: test_correctness.c $(MCELIECE348864REF_SHARED_LIB)
	$(CC) $^ -o $@

target/test_speed: test_speed.c $(MCELIECE348864REF_SHARED_LIB)
	$(CC) $^ -o $@

clean:
	$(RM) $(MCELIECE348864REF_OBJECTS)
	$(RM) $(MCELIECE348864fREF_OBJECTS)
	$(RM) $(MCELIECE460896REF_OBJECTS)
	$(RM) $(MCELIECE460896fREF_OBJECTS)
	$(RM) $(MCELIECE6688128REF_OBJECTS)
	$(RM) $(MCELIECE6688128fREF_OBJECTS)
	$(RM) $(MCELIECE6960119REF_OBJECTS)
	$(RM) $(MCELIECE6960119fREF_OBJECTS)
	$(RM) $(MCELIECE8192128REF_OBJECTS)
	$(RM) $(MCELIECE8192128fREF_OBJECTS)
	$(RM) target/*
