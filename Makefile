# compilation of ref and vec implementations
MCELIECE348864_REF_SOURCES = ref/mceliece348864/benes.c \
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
MCELIECE348864_REF_OBJECTS = $(MCELIECE348864_REF_SOURCES:.c=.o)
MCELIECE348864_REF_STATIC_LIB = target/libmceliece348864ref.a

MCELIECE348864f_REF_SOURCES = ref/mceliece348864f/benes.c \
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
MCELIECE348864f_REF_OBJECTS = $(MCELIECE348864f_REF_SOURCES:.c=.o)
MCELIECE348864f_REF_STATIC_LIB = target/libmceliece348864fref.a

MCELIECE460896_REF_SOURCES = ref/mceliece460896/benes.c \
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
MCELIECE460896_REF_OBJECTS = $(MCELIECE460896_REF_SOURCES:.c=.o)
MCELIECE460896_REF_STATIC_LIB = target/libmceliece460896ref.a

MCELIECE460896f_REF_SOURCES = ref/mceliece460896f/benes.c \
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
MCELIECE460896f_REF_OBJECTS = $(MCELIECE460896f_REF_SOURCES:.c=.o)
MCELIECE460896f_REF_STATIC_LIB = target/libmceliece460896fref.a

MCELIECE6688128_REF_SOURCES = ref/mceliece6688128/benes.c \
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
MCELIECE6688128_REF_OBJECTS = $(MCELIECE6688128_REF_SOURCES:.c=.o)
MCELIECE6688128_REF_STATIC_LIB = target/libmceliece6688128ref.a

MCELIECE6688128f_REF_SOURCES = ref/mceliece6688128f/benes.c \
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
MCELIECE6688128f_REF_OBJECTS = $(MCELIECE6688128f_REF_SOURCES:.c=.o)
MCELIECE6688128f_REF_STATIC_LIB = target/libmceliece6688128fref.a

MCELIECE6960119_REF_SOURCES = ref/mceliece6960119/benes.c \
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
MCELIECE6960119_REF_OBJECTS = $(MCELIECE6960119_REF_SOURCES:.c=.o)
MCELIECE6960119_REF_STATIC_LIB = target/libmceliece6960119ref.a

MCELIECE6960119f_REF_SOURCES = ref/mceliece6960119f/benes.c \
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
MCELIECE6960119f_REF_OBJECTS = $(MCELIECE6960119f_REF_SOURCES:.c=.o)
MCELIECE6960119f_REF_STATIC_LIB = target/libmceliece6960119fref.a

MCELIECE8192128_REF_SOURCES = ref/mceliece8192128/benes.c \
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
MCELIECE8192128_REF_OBJECTS = $(MCELIECE8192128_REF_SOURCES:.c=.o)
MCELIECE8192128_REF_STATIC_LIB = target/libmceliece8192128ref.a

MCELIECE8192128f_REF_SOURCES = ref/mceliece8192128f/benes.c \
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
MCELIECE8192128f_REF_OBJECTS = $(MCELIECE8192128f_REF_SOURCES:.c=.o)
MCELIECE8192128f_REF_STATIC_LIB = target/libmceliece8192128fref.a

MCELIECE348864_VEC_SOURCES = vec/mceliece348864/benes.c \
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
MCELIECE348864_VEC_OBJS = $(MCELIECE348864_VEC_SOURCES:.c=.o)
MCELIECE348864_VEC_STATIC_LIB = target/libmceliece348864vec.a

MCELIECE348864f_VEC_SOURCES = vec/mceliece348864f/benes.c \
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
MCELIECE348864f_VEC_OBJS = $(MCELIECE348864f_VEC_SOURCES:.c=.o)
MCELIECE348864f_VEC_STATIC_LIB = target/libmceliece348864fvec.a

MCELIECE460896_VEC_SOURCES = vec/mceliece460896/benes.c \
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
MCELIECE460896_VEC_OBJS = $(MCELIECE460896_VEC_SOURCES:.c=.o)
MCELIECE460896_VEC_STATIC_LIB = target/libmceliece460896vec.a

MCELIECE460896f_VEC_SOURCES = vec/mceliece460896f/benes.c \
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
MCELIECE460896f_VEC_OBJS = $(MCELIECE460896f_VEC_SOURCES:.c=.o)
MCELIECE460896f_VEC_STATIC_LIB = target/libmceliece460896fvec.a

MCELIECE6688128_VEC_SOURCES = vec/mceliece6688128/benes.c \
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
MCELIECE6688128_VEC_OBJS = $(MCELIECE6688128_VEC_SOURCES:.c=.o)
MCELIECE6688128_VEC_STATIC_LIB = target/libmceliece6688128vec.a

MCELIECE6688128f_VEC_SOURCES = vec/mceliece6688128f/benes.c \
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
MCELIECE6688128f_VEC_OBJS = $(MCELIECE6688128f_VEC_SOURCES:.c=.o)
MCELIECE6688128f_VEC_STATIC_LIB = target/libmceliece6688128fvec.a

MCELIECE6960119_VEC_SOURCES = vec/mceliece6960119/benes.c \
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
MCELIECE6960119_VEC_OBJS = $(MCELIECE6960119_VEC_SOURCES:.c=.o)
MCELIECE6960119_VEC_STATIC_LIB = target/libmceliece6960119vec.a

MCELIECE6960119f_VEC_SOURCES = vec/mceliece348864/benes.c \
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
MCELIECE6960119f_VEC_OBJS = $(MCELIECE6960119f_VEC_SOURCES:.c=.o)
MCELIECE6960119f_VEC_STATIC_LIB = target/libmceliece6960119fvec.a

MCELIECE8192128_VEC_SOURCES = vec/mceliece8192128/benes.c \
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
MCELIECE8192128_VEC_OBJS = $(MCELIECE8192128_VEC_SOURCES:.c=.o)
MCELIECE8192128_VEC_STATIC_LIB = target/libmceliece8192128vec.a

MCELIECE8192128f_VEC_SOURCES = vec/mceliece8192128f/benes.c \
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
MCELIECE8192128f_VEC_OBJS = $(MCELIECE8192128f_VEC_SOURCES:.c=.o)
MCELIECE8192128f_VEC_STATIC_LIB = target/libmceliece8192128fvec.a

CFLAGS = -O3

.PHONY: all tests test_correctness test_speed ref clean

ref: \
	$(MCELIECE348864_REF_STATIC_LIB) \
	$(MCELIECE348864f_REF_STATIC_LIB) \
	$(MCELIECE460896_REF_STATIC_LIB) \
	$(MCELIECE460896f_REF_STATIC_LIB) \
	$(MCELIECE6688128_REF_STATIC_LIB) \
	$(MCELIECE6688128f_REF_STATIC_LIB) \
	$(MCELIECE6960119_REF_STATIC_LIB) \
	$(MCELIECE6960119f_REF_STATIC_LIB) \
	$(MCELIECE8192128_REF_STATIC_LIB) \
	$(MCELIECE8192128f_REF_STATIC_LIB)

vec: \
	$(MCELIECE348864_VEC_STATIC_LIB) \
	$(MCELIECE348864f_VEC_STATIC_LIB) \
	$(MCELIECE460896_VEC_STATIC_LIB) \
	$(MCELIECE460896f_VEC_STATIC_LIB) \
	$(MCELIECE6688128_VEC_STATIC_LIB) \
	$(MCELIECE6688128f_VEC_STATIC_LIB) \
	$(MCELIECE6960119_VEC_STATIC_LIB) \
	$(MCELIECE6960119f_VEC_STATIC_LIB) \
	$(MCELIECE8192128_VEC_STATIC_LIB) \
	$(MCELIECE8192128f_VEC_STATIC_LIB)

$(MCELIECE348864_REF_STATIC_LIB): $(MCELIECE348864_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE348864f_REF_STATIC_LIB): $(MCELIECE348864f_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE460896_REF_STATIC_LIB): $(MCELIECE460896_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE460896f_REF_STATIC_LIB): $(MCELIECE460896f_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6688128_REF_STATIC_LIB): $(MCELIECE6688128_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6688128f_REF_STATIC_LIB): $(MCELIECE6688128f_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6960119_REF_STATIC_LIB): $(MCELIECE6960119_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE6960119f_REF_STATIC_LIB): $(MCELIECE6960119f_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE8192128_REF_STATIC_LIB): $(MCELIECE8192128_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE8192128f_REF_STATIC_LIB): $(MCELIECE8192128f_REF_OBJECTS)
	ar rcs $@ $^

$(MCELIECE348864_VEC_STATIC_LIB): $(MCELIECE348864_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE348864f_VEC_STATIC_LIB): $(MCELIECE348864f_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE460896_VEC_STATIC_LIB): $(MCELIECE460896_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE460896f_VEC_STATIC_LIB): $(MCELIECE460896f_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6688128_VEC_STATIC_LIB): $(MCELIECE6688128_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6688128f_VEC_STATIC_LIB): $(MCELIECE6688128f_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6960119_VEC_STATIC_LIB): $(MCELIECE6960119_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE6960119f_VEC_STATIC_LIB): $(MCELIECE6960119f_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE8192128_VEC_STATIC_LIB): $(MCELIECE8192128_VEC_OBJS)
	ar rcs $@ $^

$(MCELIECE8192128f_VEC_STATIC_LIB): $(MCELIECE8192128f_VEC_OBJS)
	ar rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

tests: test_correctness test_speed

test_correctness: \
	target/test_mceliece348864_ref_correctness \
	target/test_mceliece348864f_ref_correctness \
	target/test_mceliece460896_ref_correctness \
	target/test_mceliece460896f_ref_correctness \
	target/test_mceliece6688128_ref_correctness \
	target/test_mceliece6688128f_ref_correctness \
	target/test_mceliece6960119_ref_correctness \
	target/test_mceliece6960119f_ref_correctness \
	target/test_mceliece8192128_ref_correctness \
	target/test_mceliece8192128f_ref_correctness \
	target/test_mceliece348864_vec_correctness \
	target/test_mceliece348864f_vec_correctness \
	target/test_mceliece460896_vec_correctness \
	target/test_mceliece460896f_vec_correctness \
	target/test_mceliece6688128_vec_correctness \
	target/test_mceliece6688128f_vec_correctness \
	target/test_mceliece6960119_vec_correctness \
	target/test_mceliece6960119f_vec_correctness \
	target/test_mceliece8192128_vec_correctness \
	target/test_mceliece8192128f_vec_correctness

test_speed: \
	target/test_mceliece348864_ref_speed \
	target/test_mceliece348864f_ref_speed \
	target/test_mceliece460896_ref_speed \
	target/test_mceliece460896f_ref_speed \
	target/test_mceliece6688128_ref_speed \
	target/test_mceliece6688128f_ref_speed \
	target/test_mceliece6960119_ref_speed \
	target/test_mceliece6960119f_ref_speed \
	target/test_mceliece8192128_ref_speed \
	target/test_mceliece8192128f_ref_speed \
	target/test_mceliece348864_vec_speed \
	target/test_mceliece348864f_vec_speed \
	target/test_mceliece460896_vec_speed \
	target/test_mceliece460896f_vec_speed \
	target/test_mceliece6688128_vec_speed \
	target/test_mceliece6688128f_vec_speed \
	target/test_mceliece6960119_vec_speed \
	target/test_mceliece6960119f_vec_speed \
	target/test_mceliece8192128_vec_speed \
	target/test_mceliece8192128f_vec_speed

target/test_mceliece348864_ref_correctness: test_correctness.c $(MCELIECE348864_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=3488 -o $@ $^

target/test_mceliece348864_ref_speed: test_speed.c $(MCELIECE348864_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=3488 -o $@ $^

target/test_mceliece348864f_ref_correctness: test_correctness.c $(MCELIECE348864f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=3488 -DFASTKEYGEN -o $@ $^

target/test_mceliece348864f_ref_speed: test_speed.c $(MCELIECE348864f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=3488 -DFASTKEYGEN -o $@ $^

target/test_mceliece460896_ref_correctness: test_correctness.c $(MCELIECE460896_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=4608 -o $@ $^

target/test_mceliece460896_ref_speed: test_speed.c $(MCELIECE460896_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=4608 -o $@ $^

target/test_mceliece460896f_ref_correctness: test_correctness.c $(MCELIECE460896f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=4608 -DFASTKEYGEN -o $@ $^

target/test_mceliece460896f_ref_speed: test_speed.c $(MCELIECE460896f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=4608 -DFASTKEYGEN -o $@ $^

target/test_mceliece6688128_ref_correctness: test_correctness.c $(MCELIECE6688128_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6688 -o $@ $^

target/test_mceliece6688128_ref_speed: test_speed.c $(MCELIECE6688128_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6688 -o $@ $^

target/test_mceliece6688128f_ref_correctness: test_correctness.c $(MCELIECE6688128f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6688 -DFASTKEYGEN -o $@ $^

target/test_mceliece6688128f_ref_speed: test_speed.c $(MCELIECE6688128f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6688 -DFASTKEYGEN -o $@ $^

target/test_mceliece6960119_ref_correctness: test_correctness.c $(MCELIECE6960119_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6960 -o $@ $^

target/test_mceliece6960119_ref_speed: test_speed.c $(MCELIECE6960119_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6960 -o $@ $^

target/test_mceliece6960119f_ref_correctness: test_correctness.c $(MCELIECE6960119f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6960 -DFASTKEYGEN -o $@ $^

target/test_mceliece6960119f_ref_speed: test_speed.c $(MCELIECE6960119f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=6960 -DFASTKEYGEN -o $@ $^

target/test_mceliece8192128_ref_correctness: test_correctness.c $(MCELIECE8192128_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=8192 -o $@ $^

target/test_mceliece8192128_ref_speed: test_speed.c $(MCELIECE8192128_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=8192 -o $@ $^

target/test_mceliece8192128f_ref_correctness: test_correctness.c $(MCELIECE8192128f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=8192 -DFASTKEYGEN -o $@ $^

target/test_mceliece8192128f_ref_speed: test_speed.c $(MCELIECE8192128f_REF_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_REF -DMCELIECE_N=8192 -DFASTKEYGEN -o $@ $^

target/test_mceliece348864_vec_correctness: test_correctness.c $(MCELIECE348864_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=3488 -o $@ $^

target/test_mceliece348864_vec_speed: test_speed.c $(MCELIECE348864_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=3488 -o $@ $^

target/test_mceliece348864f_vec_correctness: test_correctness.c $(MCELIECE348864f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=3488 -DFASTKEYGEN -o $@ $^

target/test_mceliece348864f_vec_speed: test_speed.c $(MCELIECE348864f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=3488 -DFASTKEYGEN -o $@ $^

target/test_mceliece460896_vec_correctness: test_correctness.c $(MCELIECE460896_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=4608 -o $@ $^

target/test_mceliece460896_vec_speed: test_speed.c $(MCELIECE460896_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=4608 -o $@ $^

target/test_mceliece460896f_vec_correctness: test_correctness.c $(MCELIECE460896f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=4608 -DFASTKEYGEN -o $@ $^

target/test_mceliece460896f_vec_speed: test_speed.c $(MCELIECE460896f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=4608 -DFASTKEYGEN -o $@ $^

target/test_mceliece6688128_vec_correctness: test_correctness.c $(MCELIECE6688128_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6688 -o $@ $^

target/test_mceliece6688128_vec_speed: test_speed.c $(MCELIECE6688128_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6688 -o $@ $^

target/test_mceliece6688128f_vec_correctness: test_correctness.c $(MCELIECE6688128f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6688 -DFASTKEYGEN -o $@ $^

target/test_mceliece6688128f_vec_speed: test_speed.c $(MCELIECE6688128f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6688 -DFASTKEYGEN -o $@ $^

target/test_mceliece6960119_vec_correctness: test_correctness.c $(MCELIECE6960119_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6960 -o $@ $^

target/test_mceliece6960119_vec_speed: test_speed.c $(MCELIECE6960119_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6960 -o $@ $^

target/test_mceliece6960119f_vec_correctness: test_correctness.c $(MCELIECE6960119f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6960 -DFASTKEYGEN -o $@ $^

target/test_mceliece6960119f_vec_speed: test_speed.c $(MCELIECE6960119f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=6960 -DFASTKEYGEN -o $@ $^

target/test_mceliece8192128_vec_correctness: test_correctness.c $(MCELIECE8192128_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=8192 -o $@ $^

target/test_mceliece8192128_vec_speed: test_speed.c $(MCELIECE8192128_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=8192 -o $@ $^

target/test_mceliece8192128f_vec_correctness: test_correctness.c $(MCELIECE8192128f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=8192 -DFASTKEYGEN -o $@ $^

target/test_mceliece8192128f_vec_speed: test_speed.c $(MCELIECE8192128f_VEC_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_VEC -DMCELIECE_N=8192 -DFASTKEYGEN -o $@ $^

clean:
	$(RM) $(MCELIECE348864_REF_OBJECTS)
	$(RM) $(MCELIECE348864f_REF_OBJECTS)
	$(RM) $(MCELIECE460896_REF_OBJECTS)
	$(RM) $(MCELIECE460896f_REF_OBJECTS)
	$(RM) $(MCELIECE6688128_REF_OBJECTS)
	$(RM) $(MCELIECE6688128f_REF_OBJECTS)
	$(RM) $(MCELIECE6960119_REF_OBJECTS)
	$(RM) $(MCELIECE6960119f_REF_OBJECTS)
	$(RM) $(MCELIECE8192128_REF_OBJECTS)
	$(RM) $(MCELIECE8192128f_REF_OBJECTS)
	$(RM) $(MCELIECE348864_VEC_OBJS)
	$(RM) $(MCELIECE348864f_VEC_OBJS)
	$(RM) $(MCELIECE460896_VEC_OBJS)
	$(RM) $(MCELIECE460896f_VEC_OBJS)
	$(RM) $(MCELIECE6688128_VEC_OBJS)
	$(RM) $(MCELIECE6688128f_VEC_OBJS)
	$(RM) $(MCELIECE6960119_VEC_OBJS)
	$(RM) $(MCELIECE6960119f_VEC_OBJS)
	$(RM) $(MCELIECE8192128_VEC_OBJS)
	$(RM) $(MCELIECE8192128f_VEC_OBJS)
	$(RM) target/*
