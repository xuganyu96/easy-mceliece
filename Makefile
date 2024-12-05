MCELIECE348864HEADERS = mceliece/mceliece348864/api.h \
						mceliece/mceliece348864/benes.h \
						mceliece/mceliece348864/bm.h \
						mceliece/mceliece348864/controlbits.h \
						mceliece/mceliece348864/crypto_hash.h \
						mceliece/mceliece348864/crypto_kem.h \
						mceliece/mceliece348864/crypto_kem_mceliece348864.h \
						mceliece/mceliece348864/decrypt.h \
						mceliece/mceliece348864/encrypt.h \
						mceliece/mceliece348864/gf.h \
						mceliece/mceliece348864/int32_sort.h \
						mceliece/mceliece348864/keccak.h \
						mceliece/mceliece348864/operations.h \
						mceliece/mceliece348864/params.h \
						mceliece/mceliece348864/pk_gen.h \
						mceliece/mceliece348864/randombytes.h \
						mceliece/mceliece348864/root.h \
						mceliece/mceliece348864/sk_gen.h \
						mceliece/mceliece348864/synd.h \
						mceliece/mceliece348864/transpose.h \
						mceliece/mceliece348864/uint64_sort.h \
						mceliece/mceliece348864/util.h \
						mceliece/mceliece348864/subroutines/crypto_declassify.h \
						mceliece/mceliece348864/subroutines/crypto_int16.h \
						mceliece/mceliece348864/subroutines/crypto_int32.h \
						mceliece/mceliece348864/subroutines/crypto_uint16.h \
						mceliece/mceliece348864/subroutines/crypto_uint32.h \
						mceliece/mceliece348864/subroutines/crypto_uint64.h

MCELIECE348864SOURCES = mceliece/mceliece348864/benes.c \
						mceliece/mceliece348864/benes.c \
						mceliece/mceliece348864/bm.c \
						mceliece/mceliece348864/controlbits.c \
						mceliece/mceliece348864/decrypt.c \
						mceliece/mceliece348864/encrypt.c \
						mceliece/mceliece348864/gf.c \
						mceliece/mceliece348864/keccak.c \
						mceliece/mceliece348864/operations.c \
						mceliece/mceliece348864/pk_gen.c \
						mceliece/mceliece348864/randombytes.c \
						mceliece/mceliece348864/root.c \
						mceliece/mceliece348864/sk_gen.c \
						mceliece/mceliece348864/synd.c \
						mceliece/mceliece348864/transpose.c \
						mceliece/mceliece348864/util.c

CFLAGS += -O3

main: $(MCELIECE348864SOURCES) $(MCELIECE348864HEADERS) main.c
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCELIECE348864SOURCES) main.c -o target/$@
	./target/main

clean:
	$(RM) target/*
