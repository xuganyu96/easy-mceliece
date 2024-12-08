EASYMCELIECEHEADERS = easy-mceliece/api.h \
					  easy-mceliece/benes.h \
					  easy-mceliece/bm.h \
					  easy-mceliece/controlbits.h \
					  easy-mceliece/crypto_hash.h \
					  easy-mceliece/crypto_kem.h \
					  easy-mceliece/decrypt.h \
					  easy-mceliece/encrypt.h \
					  easy-mceliece/gf.h \
					  easy-mceliece/int32_sort.h \
					  easy-mceliece/keccak.h \
					  easy-mceliece/operations.h \
					  easy-mceliece/params.h \
					  easy-mceliece/pk_gen.h \
					  easy-mceliece/randombytes.h \
					  easy-mceliece/root.h \
					  easy-mceliece/sk_gen.h \
					  easy-mceliece/synd.h \
					  easy-mceliece/transpose.h \
					  easy-mceliece/uint64_sort.h \
					  easy-mceliece/util.h \
					  easy-mceliece/subroutines/crypto_declassify.h \
					  easy-mceliece/subroutines/crypto_int16.h \
					  easy-mceliece/subroutines/crypto_int32.h \
					  easy-mceliece/subroutines/crypto_uint16.h \
					  easy-mceliece/subroutines/crypto_uint32.h \
					  easy-mceliece/subroutines/crypto_uint64.h

EASYMCELIECESOURCES = easy-mceliece/benes.c \
					  easy-mceliece/bm.c \
					  easy-mceliece/controlbits.c \
					  easy-mceliece/decrypt.c \
					  easy-mceliece/encrypt.c \
					  easy-mceliece/gf.c \
					  easy-mceliece/keccak.c \
					  easy-mceliece/operations.c \
					  easy-mceliece/pk_gen.c \
					  easy-mceliece/randombytes.c \
					  easy-mceliece/root.c \
					  easy-mceliece/sk_gen.c \
					  easy-mceliece/synd.c \
					  easy-mceliece/transpose.c \
					  easy-mceliece/util.c

CFLAGS += -O3

.PHONY: speed tests

main: main.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DMCELIECE_N=8192 $(EASYMCELIECE8192128SOURCES) main.c -o target/$@
	./target/main

tests: target/test_mceliece348864_correctness \
	target/test_mceliece348864f_correctness \
	target/test_mceliece460896_correctness \
	target/test_mceliece460896f_correctness \
	target/test_mceliece6688128_correctness \
	target/test_mceliece6688128f_correctness \
	target/test_mceliece6960119_correctness \
	target/test_mceliece6960119f_correctness \
	target/test_mceliece8192128_correctness \
	target/test_mceliece8192128f_correctness
	./target/test_mceliece348864_correctness
	./target/test_mceliece348864f_correctness
	./target/test_mceliece460896_correctness
	./target/test_mceliece460896f_correctness
	./target/test_mceliece6688128_correctness
	./target/test_mceliece6688128f_correctness
	./target/test_mceliece6960119_correctness
	./target/test_mceliece6960119f_correctness
	./target/test_mceliece8192128_correctness
	./target/test_mceliece8192128f_correctness

speed: \
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
	./target/test_mceliece348864_speed
	./target/test_mceliece348864f_speed
	./target/test_mceliece460896_speed
	./target/test_mceliece460896f_speed
	./target/test_mceliece6688128_speed
	./target/test_mceliece6688128f_speed
	./target/test_mceliece6960119_speed
	./target/test_mceliece6960119f_speed
	./target/test_mceliece8192128_speed
	./target/test_mceliece8192128f_speed


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

clean:
	$(RM) target/*
