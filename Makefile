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
MCELIECE8192128fREF_OBJECTS = $(MCELIECE8192128fREF_SOURCES:.c=.o)
MCELIECE8192128fREF_STATIC_LIB = target/libmceliece8192128fref.a
MCELIECE8192128fREF_SHARED_LIB = target/libmceliece8192128fref.so

MCELIECE348864VEC_SOURCES = vec/mceliece348864/benes.c \
	vec/mceliece348864/bm.c \
	vec/mceliece348864/controlbits.c \
	vec/mceliece348864/decrypt.c \
	vec/mceliece348864/encrypt.c \
	vec/mceliece348864/fft.c \
	vec/mceliece348864/fft_tr.c \
	vec/mceliece348864/gf.c \
	vec/mceliece348864/keccak.c \
	vec/mceliece348864/operations.c \
	vec/mceliece348864/pk_gen.c \
	vec/mceliece348864/randombytes.c \
	vec/mceliece348864/sk_gen.c \
	vec/mceliece348864/vec.c
MCELIECE348864VEC_OBJS = $(MCELIECE348864VEC_SOURCES:.c=.o)
MCELIECE348864VEC_STATIC_LIB = target/libmceliece348864vec.a
MCELIECE348864VEC_SHARED_LIB = target/libmceliece348864vec.so

MCELIECE348864fVEC_SOURCES = vec/mceliece348864f/benes.c \
	vec/mceliece348864f/bm.c \
	vec/mceliece348864f/controlbits.c \
	vec/mceliece348864f/decrypt.c \
	vec/mceliece348864f/encrypt.c \
	vec/mceliece348864f/fft.c \
	vec/mceliece348864f/fft_tr.c \
	vec/mceliece348864f/gf.c \
	vec/mceliece348864f/keccak.c \
	vec/mceliece348864f/operations.c \
	vec/mceliece348864f/pk_gen.c \
	vec/mceliece348864f/randombytes.c \
	vec/mceliece348864f/sk_gen.c \
	vec/mceliece348864f/vec.c
MCELIECE348864fVEC_OBJS = $(MCELIECE348864fVEC_SOURCES:.c=.o)
MCELIECE348864fVEC_STATIC_LIB = target/libmceliece348864fvec.a
MCELIECE348864fVEC_SHARED_LIB = target/libmceliece348864fvec.so

MCELIECE460896VEC_SOURCES = vec/mceliece460896/benes.c \
	vec/mceliece460896/bm.c \
	vec/mceliece460896/controlbits.c \
	vec/mceliece460896/decrypt.c \
	vec/mceliece460896/encrypt.c \
	vec/mceliece460896/fft.c \
	vec/mceliece460896/fft_tr.c \
	vec/mceliece460896/gf.c \
	vec/mceliece460896/keccak.c \
	vec/mceliece460896/operations.c \
	vec/mceliece460896/pk_gen.c \
	vec/mceliece460896/randombytes.c \
	vec/mceliece460896/sk_gen.c \
	vec/mceliece460896/vec.c
MCELIECE460896VEC_OBJS = $(MCELIECE460896VEC_SOURCES:.c=.o)
MCELIECE460896VEC_STATIC_LIB = target/libmceliece460896vec.a
MCELIECE460896VEC_SHARED_LIB = target/libmceliece460896vec.so

MCELIECE460896fVEC_SOURCES = vec/mceliece460896f/benes.c \
	vec/mceliece460896f/bm.c \
	vec/mceliece460896f/controlbits.c \
	vec/mceliece460896f/decrypt.c \
	vec/mceliece460896f/encrypt.c \
	vec/mceliece460896f/fft.c \
	vec/mceliece460896f/fft_tr.c \
	vec/mceliece460896f/gf.c \
	vec/mceliece460896f/keccak.c \
	vec/mceliece460896f/operations.c \
	vec/mceliece460896f/pk_gen.c \
	vec/mceliece460896f/randombytes.c \
	vec/mceliece460896f/sk_gen.c \
	vec/mceliece460896f/vec.c
MCELIECE460896fVEC_OBJS = $(MCELIECE460896fVEC_SOURCES:.c=.o)
MCELIECE460896fVEC_STATIC_LIB = target/libmceliece460896fvec.a
MCELIECE460896fVEC_SHARED_LIB = target/libmceliece460896fvec.so

MCELIECE6688128VEC_SOURCES = vec/mceliece6688128/benes.c \
	vec/mceliece6688128/bm.c \
	vec/mceliece6688128/controlbits.c \
	vec/mceliece6688128/decrypt.c \
	vec/mceliece6688128/encrypt.c \
	vec/mceliece6688128/fft.c \
	vec/mceliece6688128/fft_tr.c \
	vec/mceliece6688128/gf.c \
	vec/mceliece6688128/keccak.c \
	vec/mceliece6688128/operations.c \
	vec/mceliece6688128/pk_gen.c \
	vec/mceliece6688128/randombytes.c \
	vec/mceliece6688128/sk_gen.c \
	vec/mceliece6688128/vec.c
MCELIECE6688128VEC_OBJS = $(MCELIECE6688128VEC_SOURCES:.c=.o)
MCELIECE6688128VEC_STATIC_LIB = target/libmceliece6688128vec.a
MCELIECE6688128VEC_SHARED_LIB = target/libmceliece6688128vec.so

MCELIECE6688128fVEC_SOURCES = vec/mceliece6688128f/benes.c \
	vec/mceliece6688128f/bm.c \
	vec/mceliece6688128f/controlbits.c \
	vec/mceliece6688128f/decrypt.c \
	vec/mceliece6688128f/encrypt.c \
	vec/mceliece6688128f/fft.c \
	vec/mceliece6688128f/fft_tr.c \
	vec/mceliece6688128f/gf.c \
	vec/mceliece6688128f/keccak.c \
	vec/mceliece6688128f/operations.c \
	vec/mceliece6688128f/pk_gen.c \
	vec/mceliece6688128f/randombytes.c \
	vec/mceliece6688128f/sk_gen.c \
	vec/mceliece6688128f/vec.c
MCELIECE6688128fVEC_OBJS = $(MCELIECE6688128fVEC_SOURCES:.c=.o)
MCELIECE6688128fVEC_STATIC_LIB = target/libmceliece6688128fvec.a
MCELIECE6688128fVEC_SHARED_LIB = target/libmceliece6688128fvec.so

MCELIECE6960119VEC_SOURCES = vec/mceliece6960119/benes.c \
	vec/mceliece6960119/bm.c \
	vec/mceliece6960119/controlbits.c \
	vec/mceliece6960119/decrypt.c \
	vec/mceliece6960119/encrypt.c \
	vec/mceliece6960119/fft.c \
	vec/mceliece6960119/fft_tr.c \
	vec/mceliece6960119/gf.c \
	vec/mceliece6960119/keccak.c \
	vec/mceliece6960119/operations.c \
	vec/mceliece6960119/pk_gen.c \
	vec/mceliece6960119/randombytes.c \
	vec/mceliece6960119/sk_gen.c \
	vec/mceliece6960119/vec.c
MCELIECE6960119VEC_OBJS = $(MCELIECE6960119VEC_SOURCES:.c=.o)
MCELIECE6960119VEC_STATIC_LIB = target/libmceliece6960119vec.a
MCELIECE6960119VEC_SHARED_LIB = target/libmceliece6960119vec.so

MCELIECE6960119fVEC_SOURCES = vec/mceliece348864/benes.c \
	vec/mceliece6960119f/bm.c \
	vec/mceliece6960119f/controlbits.c \
	vec/mceliece6960119f/decrypt.c \
	vec/mceliece6960119f/encrypt.c \
	vec/mceliece6960119f/fft.c \
	vec/mceliece6960119f/fft_tr.c \
	vec/mceliece6960119f/gf.c \
	vec/mceliece6960119f/keccak.c \
	vec/mceliece6960119f/operations.c \
	vec/mceliece6960119f/pk_gen.c \
	vec/mceliece6960119f/randombytes.c \
	vec/mceliece6960119f/sk_gen.c \
	vec/mceliece6960119f/vec.c
MCELIECE6960119fVEC_OBJS = $(MCELIECE6960119fVEC_SOURCES:.c=.o)
MCELIECE6960119fVEC_STATIC_LIB = target/libmceliece6960119fvec.a
MCELIECE6960119fVEC_SHARED_LIB = target/libmceliece6960119fvec.so

MCELIECE8192128VEC_SOURCES = vec/mceliece8192128/benes.c \
	vec/mceliece8192128/bm.c \
	vec/mceliece8192128/controlbits.c \
	vec/mceliece8192128/decrypt.c \
	vec/mceliece8192128/encrypt.c \
	vec/mceliece8192128/fft.c \
	vec/mceliece8192128/fft_tr.c \
	vec/mceliece8192128/gf.c \
	vec/mceliece8192128/keccak.c \
	vec/mceliece8192128/operations.c \
	vec/mceliece8192128/pk_gen.c \
	vec/mceliece8192128/randombytes.c \
	vec/mceliece8192128/sk_gen.c \
	vec/mceliece8192128/vec.c
MCELIECE8192128VEC_OBJS = $(MCELIECE8192128VEC_SOURCES:.c=.o)
MCELIECE8192128VEC_STATIC_LIB = target/libmceliece8192128vec.a
MCELIECE8192128VEC_SHARED_LIB = target/libmceliece8192128vec.so

MCELIECE8192128fVEC_SOURCES = vec/mceliece8192128f/benes.c \
	vec/mceliece8192128f/bm.c \
	vec/mceliece8192128f/controlbits.c \
	vec/mceliece8192128f/decrypt.c \
	vec/mceliece8192128f/encrypt.c \
	vec/mceliece8192128f/fft.c \
	vec/mceliece8192128f/fft_tr.c \
	vec/mceliece8192128f/gf.c \
	vec/mceliece8192128f/keccak.c \
	vec/mceliece8192128f/operations.c \
	vec/mceliece8192128f/pk_gen.c \
	vec/mceliece8192128f/randombytes.c \
	vec/mceliece8192128f/sk_gen.c \
	vec/mceliece8192128f/vec.c
MCELIECE8192128fVEC_OBJS = $(MCELIECE8192128fVEC_SOURCES:.c=.o)
MCELIECE8192128fVEC_STATIC_LIB = target/libmceliece8192128fvec.a
MCELIECE8192128fVEC_SHARED_LIB = target/libmceliece8192128fvec.so

.PHONY: all ref clean

ref: \
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

vec: \
	$(MCELIECE348864VEC_STATIC_LIB) \
	$(MCELIECE348864fVEC_STATIC_LIB) \
	$(MCELIECE460896VEC_STATIC_LIB) \
	$(MCELIECE460896fVEC_STATIC_LIB) \
	$(MCELIECE6688128VEC_STATIC_LIB) \
	$(MCELIECE6688128fVEC_STATIC_LIB) \
	$(MCELIECE6960119VEC_STATIC_LIB) \
	$(MCELIECE6960119fVEC_STATIC_LIB) \
	$(MCELIECE8192128VEC_STATIC_LIB) \
	$(MCELIECE8192128fVEC_STATIC_LIB) \
	$(MCELIECE348864VEC_SHARED_LIB) \
	$(MCELIECE348864fVEC_SHARED_LIB) \
	$(MCELIECE460896VEC_SHARED_LIB) \
	$(MCELIECE460896fVEC_SHARED_LIB) \
	$(MCELIECE6688128VEC_SHARED_LIB) \
	$(MCELIECE6688128fVEC_SHARED_LIB) \
	$(MCELIECE6960119VEC_SHARED_LIB) \
	$(MCELIECE6960119fVEC_SHARED_LIB) \
	$(MCELIECE8192128VEC_SHARED_LIB) \
	$(MCELIECE8192128fVEC_SHARED_LIB)

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

$(MCELIECE348864VEC_STATIC_LIB): $(MCELIECE348864VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE348864fVEC_STATIC_LIB): $(MCELIECE348864fVEC_OBJS)
	ar rcs $@ $^

$(MCELIECE460896VEC_STATIC_LIB): $(MCELIECE460896VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE460896fVEC_STATIC_LIB): $(MCELIECE460896fVEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6688128VEC_STATIC_LIB): $(MCELIECE6688128VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6688128fVEC_STATIC_LIB): $(MCELIECE6688128fVEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6960119VEC_STATIC_LIB): $(MCELIECE6960119VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6960119fVEC_STATIC_LIB): $(MCELIECE6960119fVEC_OBJS)
	ar rcs $@ $^

$(MCELIECE8192128VEC_STATIC_LIB): $(MCELIECE8192128VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE8192128fVEC_STATIC_LIB): $(MCELIECE8192128fVEC_OBJS)
	ar rcs $@ $^

$(MCELIECE348864VEC_SHARED_LIB): $(MCELIECE348864VEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE348864fVEC_SHARED_LIB): $(MCELIECE348864fVEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE460896VEC_SHARED_LIB): $(MCELIECE460896VEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE460896fVEC_SHARED_LIB): $(MCELIECE460896fVEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE6688128VEC_SHARED_LIB): $(MCELIECE6688128VEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE6688128fVEC_SHARED_LIB): $(MCELIECE6688128fVEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE6960119VEC_SHARED_LIB): $(MCELIECE6960119VEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE6960119fVEC_SHARED_LIB): $(MCELIECE6960119fVEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE8192128VEC_SHARED_LIB): $(MCELIECE8192128VEC_OBJS)
	$(CC) -shared -o $@ $^

$(MCELIECE8192128fVEC_SHARED_LIB): $(MCELIECE8192128fVEC_OBJS)
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
	$(RM) $(MCELIECE348864VEC_OBJS)
	$(RM) $(MCELIECE348864fVEC_OBJS)
	$(RM) $(MCELIECE460896VEC_OBJS)
	$(RM) $(MCELIECE460896fVEC_OBJS)
	$(RM) $(MCELIECE6688128VEC_OBJS)
	$(RM) $(MCELIECE6688128fVEC_OBJS)
	$(RM) $(MCELIECE6960119VEC_OBJS)
	$(RM) $(MCELIECE6960119fVEC_OBJS)
	$(RM) $(MCELIECE8192128VEC_OBJS)
	$(RM) $(MCELIECE8192128fVEC_OBJS)
	$(RM) target/*
