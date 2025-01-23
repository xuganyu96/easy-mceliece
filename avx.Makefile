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
MCELIECE348864_AVX_SHARED_LIB = target/libmceliece348864avx.so

.PHONY = clean

$(MCELIECE348864_AVX_SHARED_LIB): $(MCELIECE348864_AVX_SRCS) $(MCELIECE348864_AVX_ASMS)
	$(CC) -O3 -mavx -mavx2 -shared -fPIC -o $@ $^

$(MCELIECE348864_AVX_STATIC_LIB): $(MCELIECE348864_AVX_OBJS)
	ar rcs $@ $^

%.o: %.c
	$(CC) -mavx -mavx2 -c -o $@ $<

%.o: %.S
	$(CC) -mavx -mavx2 -c -o $@ $<

target/test_correctness: test_correctness.c $(MCELIECE348864_AVX_STATIC_LIB)
	$(CC) -O3 -mavx -mavx2 -o $@ $^

target/test_speed: test_speed.c $(MCELIECE348864_AVX_STATIC_LIB)
	$(CC) -O3 -mavx -mavx2 -o $@ $^


clean:
	$(RM) $(MCELIECE348864_AVX_OBJS)
	$(RM) target/*
