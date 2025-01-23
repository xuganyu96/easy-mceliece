#!/bin/bash
make -f avx.Makefile clean
make -f avx.Makefile tests -j8

echo "mceliece348864:" && ./target/test_mceliece348864_avx_correctness
echo "mceliece348864f:" && ./target/test_mceliece348864f_avx_correctness
echo "mceliece460896:" && ./target/test_mceliece460896_avx_correctness
echo "mceliece460896f:" && ./target/test_mceliece460896f_avx_correctness
echo "mceliece6688128:" && ./target/test_mceliece6688128_avx_correctness
echo "mceliece6688128f:" && ./target/test_mceliece6688128f_avx_correctness
echo "mceliece6960119:" && ./target/test_mceliece6960119_avx_correctness
echo "mceliece6960119f:" && ./target/test_mceliece6960119f_avx_correctness
echo "mceliece8192128:" && ./target/test_mceliece8192128_avx_correctness
echo "mceliece8192128f:" && ./target/test_mceliece8192128f_avx_correctness
echo "mceliece348864:" && ./target/test_mceliece348864_avx_speed
echo "mceliece348864f:" && ./target/test_mceliece348864f_avx_speed
echo "mceliece460896:" && ./target/test_mceliece460896_avx_speed
echo "mceliece460896f:" && ./target/test_mceliece460896f_avx_speed
echo "mceliece6688128:" && ./target/test_mceliece6688128_avx_speed
echo "mceliece6688128f:" && ./target/test_mceliece6688128f_avx_speed
echo "mceliece6960119:" && ./target/test_mceliece6960119_avx_speed
echo "mceliece6960119f:" && ./target/test_mceliece6960119f_avx_speed
echo "mceliece8192128:" && ./target/test_mceliece8192128_avx_speed
echo "mceliece8192128f:" && ./target/test_mceliece8192128f_avx_speed

make -f avx.Makefile clean
