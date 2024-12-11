EASYMCELIECEHEADERS = ref/api.h \
					  ref/benes.h \
					  ref/bm.h \
					  ref/controlbits.h \
					  ref/crypto_hash.h \
					  ref/crypto_kem.h \
					  ref/decrypt.h \
					  ref/encrypt.h \
					  ref/gf.h \
					  ref/int32_sort.h \
					  ref/keccak.h \
					  ref/operations.h \
					  ref/params.h \
					  ref/pk_gen.h \
					  ref/randombytes.h \
					  ref/root.h \
					  ref/sk_gen.h \
					  ref/synd.h \
					  ref/transpose.h \
					  ref/uint64_sort.h \
					  ref/util.h \
					  ref/crypto_declassify.h \
					  ref/crypto_int16.h \
					  ref/crypto_int32.h \
					  ref/crypto_uint16.h \
					  ref/crypto_uint32.h \
					  ref/crypto_uint64.h

EASYMCELIECESOURCES = ref/benes.c \
					  ref/bm.c \
					  ref/controlbits.c \
					  ref/decrypt.c \
					  ref/encrypt.c \
					  ref/gf.c \
					  ref/keccak.c \
					  ref/operations.c \
					  ref/pk_gen.c \
					  ref/randombytes.c \
					  ref/root.c \
					  ref/sk_gen.c \
					  ref/synd.c \
					  ref/transpose.c \
					  ref/util.c

EASYMCELIECEVECSOURCES = vec/benes.c \
	vec/bm.c \
	vec/controlbits.c \
	vec/decrypt.c \
	vec/encrypt.c \
	vec/fft.c \
	vec/fft_tr.c \
	vec/gf.c \
	vec/keccak.c \
	vec/operations.c \
	vec/pk_gen.c \
	vec/randombytes.c \
	vec/sk_gen.c \
	vec/vec.c

EASYMCELIECEVECHEADERS = vec/api.h \
	vec/benes.h \
	vec/bm.h \
	vec/controlbits.h \
	vec/crypto_declassify.h \
	vec/crypto_hash.h \
	vec/crypto_int16.h \
	vec/crypto_int32.h \
	vec/crypto_kem.h \
	vec/crypto_uint16.h \
	vec/crypto_uint32.h \
	vec/crypto_uint64.h \
	vec/decrypt.h \
	vec/encrypt.h \
	vec/fft.h \
	vec/fft_tr.h \
	vec/gf.h \
	vec/int32_sort.h \
	vec/keccak.h \
	vec/operations.h \
	vec/params.h \
	vec/pk_gen.h \
	vec/randombytes.h \
	vec/sk_gen.h \
	vec/transpose.h \
	vec/uint16_sort.h \
	vec/uint64_sort.h \
	vec/util.h \
	vec/vec.h

CFLAGS += -O3

.PHONY: tests test_ref test_vec speed speed_ref speed_vec

tests: test_ref test_vec

test_ref: \
	target/test_mceliece348864_correctness \
	target/test_mceliece348864f_correctness \
	target/test_mceliece460896_correctness \
	target/test_mceliece460896f_correctness \
	target/test_mceliece6688128_correctness \
	target/test_mceliece6688128f_correctness \
	target/test_mceliece6960119_correctness \
	target/test_mceliece6960119f_correctness \
	target/test_mceliece8192128_correctness \
	target/test_mceliece8192128f_correctness
	target/test_mceliece348864_correctness
	target/test_mceliece348864f_correctness
	target/test_mceliece460896_correctness
	target/test_mceliece460896f_correctness
	target/test_mceliece6688128_correctness
	target/test_mceliece6688128f_correctness
	target/test_mceliece6960119_correctness
	target/test_mceliece6960119f_correctness
	target/test_mceliece8192128_correctness
	target/test_mceliece8192128f_correctness

test_vec: \
	target/test_mceliece348864vec_correctness \
	target/test_mceliece348864fvec_correctness \
	target/test_mceliece460896vec_correctness \
	target/test_mceliece460896fvec_correctness \
	target/test_mceliece6688128vec_correctness \
	target/test_mceliece6688128fvec_correctness \
	target/test_mceliece6960119vec_correctness \
	target/test_mceliece6960119fvec_correctness \
	target/test_mceliece8192128vec_correctness \
	target/test_mceliece8192128fvec_correctness
	target/test_mceliece348864vec_correctness
	target/test_mceliece348864fvec_correctness
	target/test_mceliece460896vec_correctness
	target/test_mceliece460896fvec_correctness
	target/test_mceliece6688128vec_correctness
	target/test_mceliece6688128fvec_correctness
	target/test_mceliece6960119vec_correctness
	target/test_mceliece6960119fvec_correctness
	target/test_mceliece8192128vec_correctness
	target/test_mceliece8192128fvec_correctness

speed: speed_ref speed_vec

speed_ref: \
	target/test_mceliece348864_speed \
	target/test_mceliece460896_speed \
	target/test_mceliece6688128_speed \
	target/test_mceliece6960119_speed \
	target/test_mceliece8192128_speed \
	target/test_mceliece348864f_speed \
	target/test_mceliece460896f_speed \
	target/test_mceliece6688128f_speed \
	target/test_mceliece6960119f_speed \
	target/test_mceliece8192128f_speed
	target/test_mceliece348864_speed
	target/test_mceliece348864f_speed
	target/test_mceliece460896_speed
	target/test_mceliece460896f_speed
	target/test_mceliece6688128_speed
	target/test_mceliece6688128f_speed
	target/test_mceliece6960119_speed
	target/test_mceliece6960119f_speed
	target/test_mceliece8192128_speed
	target/test_mceliece8192128f_speed

speed_vec: \
	target/test_mceliece348864vec_speed \
	target/test_mceliece460896vec_speed \
	target/test_mceliece6688128vec_speed \
	target/test_mceliece6960119vec_speed \
	target/test_mceliece8192128vec_speed \
	target/test_mceliece348864fvec_speed \
	target/test_mceliece460896fvec_speed \
	target/test_mceliece6688128fvec_speed \
	target/test_mceliece6960119fvec_speed \
	target/test_mceliece8192128fvec_speed
	target/test_mceliece348864vec_speed
	target/test_mceliece348864fvec_speed
	target/test_mceliece460896vec_speed
	target/test_mceliece460896fvec_speed
	target/test_mceliece6688128vec_speed
	target/test_mceliece6688128fvec_speed
	target/test_mceliece6960119vec_speed
	target/test_mceliece6960119fvec_speed
	target/test_mceliece8192128vec_speed
	target/test_mceliece8192128fvec_speed

target/test_mceliece348864_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece348864_speed

target/test_mceliece348864f_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece348864f_speed

target/test_mceliece460896_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece460896_speed

target/test_mceliece460896f_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece460896f_speed

target/test_mceliece6688128_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6688128_speed

target/test_mceliece6688128f_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6688128f_speed

target/test_mceliece6960119_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6960119_speed

target/test_mceliece6960119f_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6960119f_speed

target/test_mceliece8192128_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece8192128_speed

target/test_mceliece8192128f_speed: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_speed.c -o target/test_mceliece8192128f_speed

target/test_mceliece348864_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece348864_correctness

target/test_mceliece348864f_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece348864f_correctness

target/test_mceliece460896_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece460896_correctness

target/test_mceliece460896f_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece460896f_correctness

target/test_mceliece6688128_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6688128_correctness

target/test_mceliece6688128f_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6688128f_correctness

target/test_mceliece6960119_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6960119_correctness

target/test_mceliece6960119f_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6960119f_correctness

target/test_mceliece8192128_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece8192128_correctness

target/test_mceliece8192128f_correctness: $(EASYMCELIECESOURCES) $(EASYMCELIECEHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 -DFASTKEYGEN $(EASYMCELIECESOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece8192128f_correctness

# ----- vectorized implementation -----
target/test_mceliece348864vec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece348864vec_speed

target/test_mceliece348864fvec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece348864fvec_speed

target/test_mceliece460896vec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece460896vec_speed

target/test_mceliece460896fvec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece460896fvec_speed

target/test_mceliece6688128vec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6688128vec_speed

target/test_mceliece6688128fvec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6688128fvec_speed

target/test_mceliece6960119vec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6960119vec_speed

target/test_mceliece6960119fvec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece6960119fvec_speed

target/test_mceliece8192128vec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece8192128vec_speed

target/test_mceliece8192128fvec_speed: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_speed.c -o target/test_mceliece8192128fvec_speed

target/test_mceliece348864vec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece348864vec_correctness

target/test_mceliece348864fvec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=3488 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece348864fvec_correctness

target/test_mceliece460896vec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece460896vec_correctness

target/test_mceliece460896fvec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=4608 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece460896fvec_correctness

target/test_mceliece6688128vec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6688128vec_correctness

target/test_mceliece6688128fvec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6688 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6688128fvec_correctness

target/test_mceliece6960119vec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6960119vec_correctness

target/test_mceliece6960119fvec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=6960 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece6960119fvec_correctness

target/test_mceliece8192128vec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece8192128vec_correctness

target/test_mceliece8192128fvec_correctness: $(EASYMCELIECEVECSOURCES) $(EASYMCELIECEVECHEADERS) ./tests/test_kem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 -DFASTKEYGEN $(EASYMCELIECEVECSOURCES) ./tests/test_kem_correctness.c -o target/test_mceliece8192128fvec_correctness


clean:
	$(RM) target/*
