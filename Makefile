MCELIECE8192128_SOURCES = \
	mceliece/mceliece8192128/benes.c \
	mceliece/mceliece8192128/bm.c \
	mceliece/mceliece8192128/controlbits.c \
	mceliece/mceliece8192128/crypto_hash.c \
	mceliece/mceliece8192128/decrypt.c \
	mceliece/mceliece8192128/encrypt.c \
	mceliece/mceliece8192128/fips202.c \
	mceliece/mceliece8192128/gf.c \
	mceliece/mceliece8192128/operations.c \
	mceliece/mceliece8192128/pk_gen.c \
	mceliece/mceliece8192128/randombytes.c \
	mceliece/mceliece8192128/root.c \
	mceliece/mceliece8192128/sk_gen.c \
	mceliece/mceliece8192128/synd.c \
	mceliece/mceliece8192128/transpose.c \
	mceliece/mceliece8192128/util.c

MCELIECE6960119_SOURCES = \
	mceliece/mceliece6960119/benes.c \
	mceliece/mceliece6960119/bm.c \
	mceliece/mceliece6960119/controlbits.c \
	mceliece/mceliece6960119/keccak.c \
	mceliece/mceliece6960119/decrypt.c \
	mceliece/mceliece6960119/encrypt.c \
	mceliece/mceliece6960119/gf.c \
	mceliece/mceliece6960119/operations.c \
	mceliece/mceliece6960119/pk_gen.c \
	mceliece/mceliece6960119/randombytes.c \
	mceliece/mceliece6960119/root.c \
	mceliece/mceliece6960119/sk_gen.c \
	mceliece/mceliece6960119/synd.c \
	mceliece/mceliece6960119/transpose.c \
	mceliece/mceliece6960119/util.c

CFLAGS += -O3

main: main.c
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCELIECE6960119_SOURCES) main.c -o target/$@
	./target/main

clean:
	$(RM) target/*
