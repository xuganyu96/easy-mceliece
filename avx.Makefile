# .section .rodata and .hidden directives in the assembly prevents compilation into a shared
# object, so we will only compile to static library

MCELIECE348864_AVX_SRCS = avx/mceliece348864/benes.c \
	avx/mceliece348864/bm.c \
	avx/mceliece348864/controlbits.c \
	avx/mceliece348864/decrypt.c \
	avx/mceliece348864/encrypt.c \
	avx/mceliece348864/fft.c \
	avx/mceliece348864/fft_tr.c \
	avx/mceliece348864/gf.c \
	avx/mceliece348864/int32_minmax_x86.c \
	avx/mceliece348864/int32_sort.c \
	avx/mceliece348864/keccak.c \
	avx/mceliece348864/operations.c \
	avx/mceliece348864/pk_gen.c \
	avx/mceliece348864/randombytes.c \
	avx/mceliece348864/sk_gen.c \
	avx/mceliece348864/vec.c \
	avx/mceliece348864/vec256.c
MCELIECE348864_AVX_ASMS = avx/mceliece348864/consts.S \
	avx/mceliece348864/syndrome_asm.S \
	avx/mceliece348864/transpose_64x256_sp_asm.S \
	avx/mceliece348864/transpose_64x64_asm.S \
	avx/mceliece348864/update_asm.S \
	avx/mceliece348864/vec128_mul_asm.S \
	avx/mceliece348864/vec256_mul_asm.S \
	avx/mceliece348864/vec_mul_asm.S \
	avx/mceliece348864/vec_mul_sp_asm.S \
	avx/mceliece348864/vec_reduce_asm.S
MCELIECE348864_AVX_OBJS = $(MCELIECE348864_AVX_SRCS:.c=.o) $(MCELIECE348864_AVX_ASMS:.S=.o)
MCELIECE348864_AVX_STATIC_LIB = target/libmceliece348864avx.a

MCELIECE348864f_AVX_SRCS = avx/mceliece348864f/benes.c \
	avx/mceliece348864f/bm.c \
	avx/mceliece348864f/controlbits.c \
	avx/mceliece348864f/decrypt.c \
	avx/mceliece348864f/encrypt.c \
	avx/mceliece348864f/fft.c \
	avx/mceliece348864f/fft_tr.c \
	avx/mceliece348864f/gf.c \
	avx/mceliece348864f/int32_minmax_x86.c \
	avx/mceliece348864f/int32_sort.c \
	avx/mceliece348864f/keccak.c \
	avx/mceliece348864f/operations.c \
	avx/mceliece348864f/pk_gen.c \
	avx/mceliece348864f/randombytes.c \
	avx/mceliece348864f/sk_gen.c \
	avx/mceliece348864f/vec.c \
	avx/mceliece348864f/vec256.c
MCELIECE348864f_AVX_ASMS = avx/mceliece348864f/consts.S \
	avx/mceliece348864f/syndrome_asm.S \
	avx/mceliece348864f/transpose_64x256_sp_asm.S \
	avx/mceliece348864f/transpose_64x64_asm.S \
	avx/mceliece348864f/update_asm.S \
	avx/mceliece348864f/vec128_mul_asm.S \
	avx/mceliece348864f/vec256_mul_asm.S \
	avx/mceliece348864f/vec_mul_asm.S \
	avx/mceliece348864f/vec_mul_sp_asm.S \
	avx/mceliece348864f/vec_reduce_asm.S
MCELIECE348864f_AVX_OBJS = $(MCELIECE348864f_AVX_SRCS:.c=.o) $(MCELIECE348864f_AVX_ASMS:.S=.o)
MCELIECE348864f_AVX_STATIC_LIB = target/libmceliece348864favx.a

MCELIECE460896_AVX_SRCS = avx/mceliece460896/benes.c \
	avx/mceliece460896/bm.c \
	avx/mceliece460896/controlbits.c \
	avx/mceliece460896/decrypt.c \
	avx/mceliece460896/encrypt.c \
	avx/mceliece460896/fft.c \
	avx/mceliece460896/fft_tr.c \
	avx/mceliece460896/gf.c \
	avx/mceliece460896/int32_minmax_x86.c \
	avx/mceliece460896/int32_sort.c \
	avx/mceliece460896/keccak.c \
	avx/mceliece460896/operations.c \
	avx/mceliece460896/pk_gen.c \
	avx/mceliece460896/randombytes.c \
	avx/mceliece460896/sk_gen.c \
	avx/mceliece460896/vec128.c \
	avx/mceliece460896/vec256.c
MCELIECE460896_AVX_ASMS = avx/mceliece460896/consts.S \
	avx/mceliece460896/syndrome_asm.S \
	avx/mceliece460896/transpose_64x128_sp_asm.S \
	avx/mceliece460896/transpose_64x256_sp_asm.S \
	avx/mceliece460896/transpose_64x64_asm.S \
	avx/mceliece460896/update_asm.S \
	avx/mceliece460896/vec128_mul_asm.S \
	avx/mceliece460896/vec256_ama_asm.S \
	avx/mceliece460896/vec256_maa_asm.S \
	avx/mceliece460896/vec256_mul_asm.S \
	avx/mceliece460896/vec_reduce_asm.S
MCELIECE460896_AVX_OBJS = $(MCELIECE460896_AVX_SRCS:.c=.o) $(MCELIECE460896_AVX_ASMS:.S=.o)
MCELIECE460896_AVX_STATIC_LIB = target/libmceliece460896avx.a

MCELIECE460896f_AVX_SRCS = avx/mceliece460896f/benes.c \
	avx/mceliece460896f/bm.c \
	avx/mceliece460896f/controlbits.c \
	avx/mceliece460896f/decrypt.c \
	avx/mceliece460896f/encrypt.c \
	avx/mceliece460896f/fft.c \
	avx/mceliece460896f/fft_tr.c \
	avx/mceliece460896f/gf.c \
	avx/mceliece460896f/int32_minmax_x86.c \
	avx/mceliece460896f/int32_sort.c \
	avx/mceliece460896f/keccak.c \
	avx/mceliece460896f/operations.c \
	avx/mceliece460896f/pk_gen.c \
	avx/mceliece460896f/randombytes.c \
	avx/mceliece460896f/sk_gen.c \
	avx/mceliece460896f/vec128.c \
	avx/mceliece460896f/vec256.c
MCELIECE460896f_AVX_ASMS = avx/mceliece460896f/consts.S \
	avx/mceliece460896f/syndrome_asm.S \
	avx/mceliece460896f/transpose_64x128_sp_asm.S \
	avx/mceliece460896f/transpose_64x256_sp_asm.S \
	avx/mceliece460896f/transpose_64x64_asm.S \
	avx/mceliece460896f/update_asm.S \
	avx/mceliece460896f/vec128_mul_asm.S \
	avx/mceliece460896f/vec256_ama_asm.S \
	avx/mceliece460896f/vec256_maa_asm.S \
	avx/mceliece460896f/vec256_mul_asm.S \
	avx/mceliece460896f/vec_reduce_asm.S
MCELIECE460896f_AVX_OBJS = $(MCELIECE460896f_AVX_SRCS:.c=.o) $(MCELIECE460896f_AVX_ASMS:.S=.o)
MCELIECE460896f_AVX_STATIC_LIB = target/libmceliece460896favx.a

MCELIECE6688128_AVX_SRCS = avx/mceliece6688128/benes.c \
	avx/mceliece6688128/bm.c \
	avx/mceliece6688128/controlbits.c \
	avx/mceliece6688128/decrypt.c \
	avx/mceliece6688128/encrypt.c \
	avx/mceliece6688128/fft.c \
	avx/mceliece6688128/fft_tr.c \
	avx/mceliece6688128/gf.c \
	avx/mceliece6688128/int32_minmax_x86.c \
	avx/mceliece6688128/int32_sort.c \
	avx/mceliece6688128/keccak.c \
	avx/mceliece6688128/operations.c \
	avx/mceliece6688128/pk_gen.c \
	avx/mceliece6688128/randombytes.c \
	avx/mceliece6688128/sk_gen.c \
	avx/mceliece6688128/vec128.c \
	avx/mceliece6688128/vec256.c
MCELIECE6688128_AVX_ASMS = avx/mceliece6688128/consts.S \
	avx/mceliece6688128/syndrome_asm.S \
	avx/mceliece6688128/transpose_64x128_sp_asm.S \
	avx/mceliece6688128/transpose_64x256_sp_asm.S \
	avx/mceliece6688128/transpose_64x64_asm.S \
	avx/mceliece6688128/update_asm.S \
	avx/mceliece6688128/vec128_mul_asm.S \
	avx/mceliece6688128/vec256_ama_asm.S \
	avx/mceliece6688128/vec256_maa_asm.S \
	avx/mceliece6688128/vec256_mul_asm.S \
	avx/mceliece6688128/vec_reduce_asm.S
MCELIECE6688128_AVX_OBJS = $(MCELIECE6688128_AVX_SRCS:.c=.o) $(MCELIECE6688128_AVX_ASMS:.S=.o)
MCELIECE6688128_AVX_STATIC_LIB = target/libmceliece6688128avx.a

MCELIECE6688128f_AVX_SRCS = avx/mceliece6688128f/benes.c \
	avx/mceliece6688128f/bm.c \
	avx/mceliece6688128f/controlbits.c \
	avx/mceliece6688128f/decrypt.c \
	avx/mceliece6688128f/encrypt.c \
	avx/mceliece6688128f/fft.c \
	avx/mceliece6688128f/fft_tr.c \
	avx/mceliece6688128f/gf.c \
	avx/mceliece6688128f/int32_minmax_x86.c \
	avx/mceliece6688128f/int32_sort.c \
	avx/mceliece6688128f/keccak.c \
	avx/mceliece6688128f/operations.c \
	avx/mceliece6688128f/pk_gen.c \
	avx/mceliece6688128f/randombytes.c \
	avx/mceliece6688128f/sk_gen.c \
	avx/mceliece6688128f/vec128.c \
	avx/mceliece6688128f/vec256.c
MCELIECE6688128f_AVX_ASMS = avx/mceliece6688128f/consts.S \
	avx/mceliece6688128f/syndrome_asm.S \
	avx/mceliece6688128f/transpose_64x128_sp_asm.S \
	avx/mceliece6688128f/transpose_64x256_sp_asm.S \
	avx/mceliece6688128f/transpose_64x64_asm.S \
	avx/mceliece6688128f/update_asm.S \
	avx/mceliece6688128f/vec128_mul_asm.S \
	avx/mceliece6688128f/vec256_ama_asm.S \
	avx/mceliece6688128f/vec256_maa_asm.S \
	avx/mceliece6688128f/vec256_mul_asm.S \
	avx/mceliece6688128f/vec_reduce_asm.S
MCELIECE6688128f_AVX_OBJS = $(MCELIECE6688128f_AVX_SRCS:.c=.o) $(MCELIECE6688128f_AVX_ASMS:.S=.o)
MCELIECE6688128f_AVX_STATIC_LIB = target/libmceliece6688128favx.a

MCELIECE6960119_AVX_SRCS = avx/mceliece6960119/benes.c \
	avx/mceliece6960119/bm.c \
	avx/mceliece6960119/controlbits.c \
	avx/mceliece6960119/decrypt.c \
	avx/mceliece6960119/encrypt.c \
	avx/mceliece6960119/fft.c \
	avx/mceliece6960119/fft_tr.c \
	avx/mceliece6960119/gf.c \
	avx/mceliece6960119/int32_minmax_x86.c \
	avx/mceliece6960119/int32_sort.c \
	avx/mceliece6960119/keccak.c \
	avx/mceliece6960119/operations.c \
	avx/mceliece6960119/pk_gen.c \
	avx/mceliece6960119/randombytes.c \
	avx/mceliece6960119/sk_gen.c \
	avx/mceliece6960119/vec128.c \
	avx/mceliece6960119/vec256.c
MCELIECE6960119_AVX_ASMS = avx/mceliece6960119/consts.S \
	avx/mceliece6960119/syndrome_asm.S \
	avx/mceliece6960119/transpose_64x128_sp_asm.S \
	avx/mceliece6960119/transpose_64x256_sp_asm.S \
	avx/mceliece6960119/transpose_64x64_asm.S \
	avx/mceliece6960119/update_asm.S \
	avx/mceliece6960119/vec128_mul_asm.S \
	avx/mceliece6960119/vec256_ama_asm.S \
	avx/mceliece6960119/vec256_maa_asm.S \
	avx/mceliece6960119/vec256_mul_asm.S \
	avx/mceliece6960119/vec_reduce_asm.S
MCELIECE6960119_AVX_OBJS = $(MCELIECE6960119_AVX_SRCS:.c=.o) $(MCELIECE6960119_AVX_ASMS:.S=.o)
MCELIECE6960119_AVX_STATIC_LIB = target/libmceliece6960119avx.a

MCELIECE6960119f_AVX_SRCS = avx/mceliece6960119f/benes.c \
	avx/mceliece6960119f/bm.c \
	avx/mceliece6960119f/controlbits.c \
	avx/mceliece6960119f/decrypt.c \
	avx/mceliece6960119f/encrypt.c \
	avx/mceliece6960119f/fft.c \
	avx/mceliece6960119f/fft_tr.c \
	avx/mceliece6960119f/gf.c \
	avx/mceliece6960119f/int32_minmax_x86.c \
	avx/mceliece6960119f/int32_sort.c \
	avx/mceliece6960119f/keccak.c \
	avx/mceliece6960119f/operations.c \
	avx/mceliece6960119f/pk_gen.c \
	avx/mceliece6960119f/randombytes.c \
	avx/mceliece6960119f/sk_gen.c \
	avx/mceliece6960119f/vec128.c \
	avx/mceliece6960119f/vec256.c
MCELIECE6960119f_AVX_ASMS = avx/mceliece6960119f/consts.S \
	avx/mceliece6960119f/syndrome_asm.S \
	avx/mceliece6960119f/transpose_64x128_sp_asm.S \
	avx/mceliece6960119f/transpose_64x256_sp_asm.S \
	avx/mceliece6960119f/transpose_64x64_asm.S \
	avx/mceliece6960119f/update_asm.S \
	avx/mceliece6960119f/vec128_mul_asm.S \
	avx/mceliece6960119f/vec256_ama_asm.S \
	avx/mceliece6960119f/vec256_maa_asm.S \
	avx/mceliece6960119f/vec256_mul_asm.S \
	avx/mceliece6960119f/vec_reduce_asm.S
MCELIECE6960119f_AVX_OBJS = $(MCELIECE6960119f_AVX_SRCS:.c=.o) $(MCELIECE6960119f_AVX_ASMS:.S=.o)
MCELIECE6960119f_AVX_STATIC_LIB = target/libmceliece6960119favx.a

MCELIECE8192128_AVX_SRCS = avx/mceliece8192128/benes.c \
	avx/mceliece8192128/bm.c \
	avx/mceliece8192128/controlbits.c \
	avx/mceliece8192128/decrypt.c \
	avx/mceliece8192128/encrypt.c \
	avx/mceliece8192128/fft.c \
	avx/mceliece8192128/fft_tr.c \
	avx/mceliece8192128/gf.c \
	avx/mceliece8192128/int32_minmax_x86.c \
	avx/mceliece8192128/int32_sort.c \
	avx/mceliece8192128/keccak.c \
	avx/mceliece8192128/operations.c \
	avx/mceliece8192128/pk_gen.c \
	avx/mceliece8192128/randombytes.c \
	avx/mceliece8192128/sk_gen.c \
	avx/mceliece8192128/vec128.c \
	avx/mceliece8192128/vec256.c
MCELIECE8192128_AVX_ASMS = avx/mceliece8192128/consts.S \
	avx/mceliece8192128/syndrome_asm.S \
	avx/mceliece8192128/transpose_64x128_sp_asm.S \
	avx/mceliece8192128/transpose_64x256_sp_asm.S \
	avx/mceliece8192128/transpose_64x64_asm.S \
	avx/mceliece8192128/update_asm.S \
	avx/mceliece8192128/vec128_mul_asm.S \
	avx/mceliece8192128/vec256_ama_asm.S \
	avx/mceliece8192128/vec256_maa_asm.S \
	avx/mceliece8192128/vec256_mul_asm.S \
	avx/mceliece8192128/vec_reduce_asm.S
MCELIECE8192128_AVX_OBJS = $(MCELIECE8192128_AVX_SRCS:.c=.o) $(MCELIECE8192128_AVX_ASMS:.S=.o)
MCELIECE8192128_AVX_STATIC_LIB = target/libmceliece8192128avx.a

MCELIECE8192128f_AVX_SRCS = avx/mceliece8192128f/benes.c \
	avx/mceliece8192128f/bm.c \
	avx/mceliece8192128f/controlbits.c \
	avx/mceliece8192128f/decrypt.c \
	avx/mceliece8192128f/encrypt.c \
	avx/mceliece8192128f/fft.c \
	avx/mceliece8192128f/fft_tr.c \
	avx/mceliece8192128f/gf.c \
	avx/mceliece8192128f/int32_minmax_x86.c \
	avx/mceliece8192128f/int32_sort.c \
	avx/mceliece8192128f/keccak.c \
	avx/mceliece8192128f/operations.c \
	avx/mceliece8192128f/pk_gen.c \
	avx/mceliece8192128f/randombytes.c \
	avx/mceliece8192128f/sk_gen.c \
	avx/mceliece8192128f/vec128.c \
	avx/mceliece8192128f/vec256.c
MCELIECE8192128f_AVX_ASMS = avx/mceliece8192128f/consts.S \
	avx/mceliece8192128f/syndrome_asm.S \
	avx/mceliece8192128f/transpose_64x128_sp_asm.S \
	avx/mceliece8192128f/transpose_64x256_sp_asm.S \
	avx/mceliece8192128f/transpose_64x64_asm.S \
	avx/mceliece8192128f/update_asm.S \
	avx/mceliece8192128f/vec128_mul_asm.S \
	avx/mceliece8192128f/vec256_ama_asm.S \
	avx/mceliece8192128f/vec256_maa_asm.S \
	avx/mceliece8192128f/vec256_mul_asm.S \
	avx/mceliece8192128f/vec_reduce_asm.S
MCELIECE8192128f_AVX_OBJS = $(MCELIECE8192128f_AVX_SRCS:.c=.o) $(MCELIECE8192128f_AVX_ASMS:.S=.o)
MCELIECE8192128f_AVX_STATIC_LIB = target/libmceliece8192128favx.a


CFLAGS += -O3 -mavx -mavx2 -z noexecstack

.PHONY: all tests test_correctness test_speed clean

all: \
	$(MCELIECE348864_AVX_STATIC_LIB) \
	$(MCELIECE348864f_AVX_STATIC_LIB) \
	$(MCELIECE460896_AVX_STATIC_LIB) \
	$(MCELIECE460896f_AVX_STATIC_LIB) \
	$(MCELIECE6688128_AVX_STATIC_LIB) \
	$(MCELIECE6688128f_AVX_STATIC_LIB) \
	$(MCELIECE6960119_AVX_STATIC_LIB) \
	$(MCELIECE6960119f_AVX_STATIC_LIB) \
	$(MCELIECE8192128_AVX_STATIC_LIB) \
	$(MCELIECE8192128f_AVX_STATIC_LIB)

$(MCELIECE348864_AVX_STATIC_LIB): $(MCELIECE348864_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE348864f_AVX_STATIC_LIB): $(MCELIECE348864f_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE460896_AVX_STATIC_LIB): $(MCELIECE460896_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE460896f_AVX_STATIC_LIB): $(MCELIECE460896f_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE6688128_AVX_STATIC_LIB): $(MCELIECE6688128_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE6688128f_AVX_STATIC_LIB): $(MCELIECE6688128f_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE6960119_AVX_STATIC_LIB): $(MCELIECE6960119_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE6960119f_AVX_STATIC_LIB): $(MCELIECE6960119f_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE8192128_AVX_STATIC_LIB): $(MCELIECE8192128_AVX_OBJS)
	ar rcs $@ $^

$(MCELIECE8192128f_AVX_STATIC_LIB): $(MCELIECE8192128f_AVX_OBJS)
	ar rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.S
	$(CC) $(CFLAGS) -c -o $@ $<

tests: test_correctness test_speed

test_correctness: \
	target/test_mceliece348864_avx_correctness \
	target/test_mceliece348864f_avx_correctness \
	target/test_mceliece460896_avx_correctness \
	target/test_mceliece460896f_avx_correctness \
	target/test_mceliece6688128_avx_correctness \
	target/test_mceliece6688128f_avx_correctness \
	target/test_mceliece6960119_avx_correctness \
	target/test_mceliece6960119f_avx_correctness \
	target/test_mceliece8192128_avx_correctness \
	target/test_mceliece8192128f_avx_correctness

test_speed: \
	target/test_mceliece348864_avx_speed \
	target/test_mceliece348864f_avx_speed \
	target/test_mceliece460896_avx_speed \
	target/test_mceliece460896f_avx_speed \
	target/test_mceliece6688128_avx_speed \
	target/test_mceliece6688128f_avx_speed \
	target/test_mceliece6960119_avx_speed \
	target/test_mceliece6960119f_avx_speed \
	target/test_mceliece8192128_avx_speed \
	target/test_mceliece8192128f_avx_speed

target/test_mceliece348864_avx_correctness: test_correctness.c $(MCELIECE348864_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=3488 -o $@ $^

target/test_mceliece348864_avx_speed: test_speed.c $(MCELIECE348864_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=3488 -o $@ $^

target/test_mceliece348864f_avx_correctness: test_correctness.c $(MCELIECE348864f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=3488 -DFASTKEYGEN -o $@ $^

target/test_mceliece348864f_avx_speed: test_speed.c $(MCELIECE348864f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=3488 -DFASTKEYGEN -o $@ $^

target/test_mceliece460896_avx_correctness: test_correctness.c $(MCELIECE460896_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=4608 -o $@ $^

target/test_mceliece460896_avx_speed: test_speed.c $(MCELIECE460896_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=4608 -o $@ $^

target/test_mceliece460896f_avx_correctness: test_correctness.c $(MCELIECE460896f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=4608 -DFASTKEYGEN -o $@ $^

target/test_mceliece460896f_avx_speed: test_speed.c $(MCELIECE460896f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=4608 -DFASTKEYGEN -o $@ $^

target/test_mceliece6688128_avx_correctness: test_correctness.c $(MCELIECE6688128_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6688 -o $@ $^

target/test_mceliece6688128_avx_speed: test_speed.c $(MCELIECE6688128_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6688 -o $@ $^

target/test_mceliece6688128f_avx_correctness: test_correctness.c $(MCELIECE6688128f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6688 -DFASTKEYGEN -o $@ $^

target/test_mceliece6688128f_avx_speed: test_speed.c $(MCELIECE6688128f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6688 -DFASTKEYGEN -o $@ $^

target/test_mceliece6960119_avx_correctness: test_correctness.c $(MCELIECE6960119_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6960 -o $@ $^

target/test_mceliece6960119_avx_speed: test_speed.c $(MCELIECE6960119_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6960 -o $@ $^

target/test_mceliece6960119f_avx_correctness: test_correctness.c $(MCELIECE6960119f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6960 -DFASTKEYGEN -o $@ $^

target/test_mceliece6960119f_avx_speed: test_speed.c $(MCELIECE6960119f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=6960 -DFASTKEYGEN -o $@ $^

target/test_mceliece8192128_avx_correctness: test_correctness.c $(MCELIECE8192128_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=8192 -o $@ $^

target/test_mceliece8192128_avx_speed: test_speed.c $(MCELIECE8192128_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=8192 -o $@ $^

target/test_mceliece8192128f_avx_correctness: test_correctness.c $(MCELIECE8192128f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=8192 -DFASTKEYGEN -o $@ $^

target/test_mceliece8192128f_avx_speed: test_speed.c $(MCELIECE8192128f_AVX_STATIC_LIB)
	$(CC) $(CFLAGS) -DARCH_AVX -DMCELIECE_N=8192 -DFASTKEYGEN -o $@ $^


clean:
	$(RM) $(MCELIECE348864_AVX_OBJS)
	$(RM) $(MCELIECE348864f_AVX_OBJS)
	$(RM) $(MCELIECE460896_AVX_OBJS)
	$(RM) $(MCELIECE460896f_AVX_OBJS)
	$(RM) $(MCELIECE6688128_AVX_OBJS)
	$(RM) $(MCELIECE6688128f_AVX_OBJS)
	$(RM) $(MCELIECE6960119_AVX_OBJS)
	$(RM) $(MCELIECE6960119f_AVX_OBJS)
	$(RM) $(MCELIECE8192128_AVX_OBJS)
	$(RM) $(MCELIECE8192128f_AVX_OBJS)
	$(RM) target/*
