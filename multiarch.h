/**
 * Define the correct key/ciphertext sizes depending on the variants and the
 * architecture
 * 
 * Architecture is defined by the compiler flags:
 * ARCH_REF, ARCH_VEC, ARCH_AVX, ARCH_SSE
 *
 * Variants are defined by MCELIECE_N and FASTKEYGEN
 * MCELIECE_N: 3488, 4608, 6688, 6960, 8192
 * If FASTKEYGEN is defined then the f-variants are used
 *
 * with "api.h" and "operations.h" included, the sizes and function names are:
 * CRYPTO_PUBLICKEYBYTES, CRYPTO_SECRETKEYBYTES, CRYPTO_CIPHERTEXTBYTES,
 * CRYPTO_BYTES, crypto_kem_keypair, crypto_kem_enc, crypto_kem_dec
 */
#ifndef MULTIARCH_H
#define MULTIARCH_H

#if defined(ARCH_REF) && (MCELIECE_N == 3488) && !defined(FASTKEYGEN)
#include "ref/mceliece348864/api.h"
#include "ref/mceliece348864/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 3488) && defined(FASTKEYGEN)
#include "ref/mceliece348864f/api.h"
#include "ref/mceliece348864f/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 4608) && !defined(FASTKEYGEN)
#include "ref/mceliece460896/api.h"
#include "ref/mceliece460896/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 4608) && defined(FASTKEYGEN)
#include "ref/mceliece460896f/api.h"
#include "ref/mceliece460896f/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 6688) && !defined(FASTKEYGEN)
#include "ref/mceliece6688128/api.h"
#include "ref/mceliece6688128/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 6688) && defined(FASTKEYGEN)
#include "ref/mceliece6688128f/api.h"
#include "ref/mceliece6688128f/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 6960) && !defined(FASTKEYGEN)
#include "ref/mceliece6960119/api.h"
#include "ref/mceliece6960119/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 6960) && defined(FASTKEYGEN)
#include "ref/mceliece6960119f/api.h"
#include "ref/mceliece6960119f/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 8192) && !defined(FASTKEYGEN)
#include "ref/mceliece8192128/api.h"
#include "ref/mceliece8192128/operations.h"
#elif defined(ARCH_REF) && (MCELIECE_N == 8192) && defined(FASTKEYGEN)
#include "ref/mceliece8192128f/api.h"
#include "ref/mceliece8192128f/operations.h"


#elif defined(ARCH_VEC) && (MCELIECE_N == 3488) && !defined(FASTKEYGEN)
#include "vec/mceliece348864/api.h"
#include "vec/mceliece348864/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 3488) && defined(FASTKEYGEN)
#include "vec/mceliece348864f/api.h"
#include "vec/mceliece348864f/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 4608) && !defined(FASTKEYGEN)
#include "vec/mceliece460896/api.h"
#include "vec/mceliece460896/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 4608) && defined(FASTKEYGEN)
#include "vec/mceliece460896f/api.h"
#include "vec/mceliece460896f/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 6688) && !defined(FASTKEYGEN)
#include "vec/mceliece6688128/api.h"
#include "vec/mceliece6688128/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 6688) && defined(FASTKEYGEN)
#include "vec/mceliece6688128f/api.h"
#include "vec/mceliece6688128f/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 6960) && !defined(FASTKEYGEN)
#include "vec/mceliece6960119/api.h"
#include "vec/mceliece6960119/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 6960) && defined(FASTKEYGEN)
#include "vec/mceliece6960119f/api.h"
#include "vec/mceliece6960119f/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 8192) && !defined(FASTKEYGEN)
#include "vec/mceliece8192128/api.h"
#include "vec/mceliece8192128/operations.h"
#elif defined(ARCH_VEC) && (MCELIECE_N == 8192) && defined(FASTKEYGEN)
#include "vec/mceliece8192128f/api.h"
#include "vec/mceliece8192128f/operations.h"

#elif defined(ARCH_AVX) && (MCELIECE_N == 3488) && !defined(FASTKEYGEN)
#include "avx/mceliece348864/api.h"
#include "avx/mceliece348864/operations.h"
#include "avx/mceliece348864/decrypt.h"
#include "avx/mceliece348864/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 3488) && defined(FASTKEYGEN)
#include "avx/mceliece348864f/api.h"
#include "avx/mceliece348864f/operations.h"
#include "avx/mceliece348864f/decrypt.h"
#include "avx/mceliece348864f/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 4608) && !defined(FASTKEYGEN)
#include "avx/mceliece460896/api.h"
#include "avx/mceliece460896/operations.h"
#include "avx/mceliece460896/decrypt.h"
#include "avx/mceliece460896/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 4608) && defined(FASTKEYGEN)
#include "avx/mceliece460896f/api.h"
#include "avx/mceliece460896f/operations.h"
#include "avx/mceliece460896f/decrypt.h"
#include "avx/mceliece460896f/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 6688) && !defined(FASTKEYGEN)
#include "avx/mceliece6688128/api.h"
#include "avx/mceliece6688128/operations.h"
#include "avx/mceliece6688128/decrypt.h"
#include "avx/mceliece6688128/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 6688) && defined(FASTKEYGEN)
#include "avx/mceliece6688128f/api.h"
#include "avx/mceliece6688128f/operations.h"
#include "avx/mceliece6688128f/decrypt.h"
#include "avx/mceliece6688128f/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 6960) && !defined(FASTKEYGEN)
#include "avx/mceliece6960119/api.h"
#include "avx/mceliece6960119/operations.h"
#include "avx/mceliece6960119/decrypt.h"
#include "avx/mceliece6960119/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 6960) && defined(FASTKEYGEN)
#include "avx/mceliece6960119f/api.h"
#include "avx/mceliece6960119f/operations.h"
#include "avx/mceliece6960119f/decrypt.h"
#include "avx/mceliece6960119f/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 8192) && !defined(FASTKEYGEN)
#include "avx/mceliece8192128/api.h"
#include "avx/mceliece8192128/operations.h"
#include "avx/mceliece8192128/decrypt.h"
#include "avx/mceliece8192128/params.h"
#elif defined(ARCH_AVX) && (MCELIECE_N == 8192) && defined(FASTKEYGEN)
#include "avx/mceliece8192128f/api.h"
#include "avx/mceliece8192128f/operations.h"
#include "avx/mceliece8192128f/decrypt.h"
#include "avx/mceliece8192128f/params.h"

#elif defined(ARCH_SSE) && (MCELIECE_N == 3488) && !defined(FASTKEYGEN)
#include "sse/mceliece348864/api.h"
#include "sse/mceliece348864/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 3488) && defined(FASTKEYGEN)
#include "sse/mceliece348864f/api.h"
#include "sse/mceliece348864f/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 4608) && !defined(FASTKEYGEN)
#include "sse/mceliece460896/api.h"
#include "sse/mceliece460896/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 4608) && defined(FASTKEYGEN)
#include "sse/mceliece460896f/api.h"
#include "sse/mceliece460896f/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 6688) && !defined(FASTKEYGEN)
#include "sse/mceliece6688128/api.h"
#include "sse/mceliece6688128/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 6688) && defined(FASTKEYGEN)
#include "sse/mceliece6688128f/api.h"
#include "sse/mceliece6688128f/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 6960) && !defined(FASTKEYGEN)
#include "sse/mceliece6960119/api.h"
#include "sse/mceliece6960119/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 6960) && defined(FASTKEYGEN)
#include "sse/mceliece6960119f/api.h"
#include "sse/mceliece6960119f/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 8192) && !defined(FASTKEYGEN)
#include "sse/mceliece8192128/api.h"
#include "sse/mceliece8192128/operations.h"
#elif defined(ARCH_SSE) && (MCELIECE_N == 8192) && defined(FASTKEYGEN)
#include "sse/mceliece8192128f/api.h"
#include "sse/mceliece8192128f/operations.h"

#else
#error "invalid combination of architecture, MCELIECE_N, and FASTKEYGEN"
#endif

#endif

