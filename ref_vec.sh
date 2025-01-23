#!/bin/bash
make clean
make tests

echo "mceliece348864_ref:" && ./target/test_mceliece348864_ref_correctness
echo "mceliece348864f_ref:" && ./target/test_mceliece348864f_ref_correctness
echo "mceliece460896_ref:" && ./target/test_mceliece460896_ref_correctness
echo "mceliece460896f_ref:" && ./target/test_mceliece460896f_ref_correctness
echo "mceliece6688128_ref:" && ./target/test_mceliece6688128_ref_correctness
echo "mceliece6688128f_ref:" && ./target/test_mceliece6688128f_ref_correctness
echo "mceliece6960119_ref:" && ./target/test_mceliece6960119_ref_correctness
echo "mceliece6960119f_ref:" && ./target/test_mceliece6960119f_ref_correctness
echo "mceliece8192128_ref:" && ./target/test_mceliece8192128_ref_correctness
echo "mceliece8192128f_ref:" && ./target/test_mceliece8192128f_ref_correctness
echo "mceliece348864_ref:" && ./target/test_mceliece348864_ref_speed
echo "mceliece348864f_ref:" && ./target/test_mceliece348864f_ref_speed
echo "mceliece460896_ref:" && ./target/test_mceliece460896_ref_speed
echo "mceliece460896f_ref:" && ./target/test_mceliece460896f_ref_speed
echo "mceliece6688128_ref:" && ./target/test_mceliece6688128_ref_speed
echo "mceliece6688128f_ref:" && ./target/test_mceliece6688128f_ref_speed
echo "mceliece6960119_ref:" && ./target/test_mceliece6960119_ref_speed
echo "mceliece6960119f_ref:" && ./target/test_mceliece6960119f_ref_speed
echo "mceliece8192128_ref:" && ./target/test_mceliece8192128_ref_speed
echo "mceliece8192128f_ref:" && ./target/test_mceliece8192128f_ref_speed

echo "mceliece348864_vec:" && ./target/test_mceliece348864_vec_correctness
echo "mceliece348864f_vec:" && ./target/test_mceliece348864f_vec_correctness
echo "mceliece460896_vec:" && ./target/test_mceliece460896_vec_correctness
echo "mceliece460896f_vec:" && ./target/test_mceliece460896f_vec_correctness
echo "mceliece6688128_vec:" && ./target/test_mceliece6688128_vec_correctness
echo "mceliece6688128f_vec:" && ./target/test_mceliece6688128f_vec_correctness
echo "mceliece6960119_vec:" && ./target/test_mceliece6960119_vec_correctness
echo "mceliece6960119f_vec:" && ./target/test_mceliece6960119f_vec_correctness
echo "mceliece8192128_vec:" && ./target/test_mceliece8192128_vec_correctness
echo "mceliece8192128f_vec:" && ./target/test_mceliece8192128f_vec_correctness
echo "mceliece348864_vec:" && ./target/test_mceliece348864_vec_speed
echo "mceliece348864f_vec:" && ./target/test_mceliece348864f_vec_speed
echo "mceliece460896_vec:" && ./target/test_mceliece460896_vec_speed
echo "mceliece460896f_vec:" && ./target/test_mceliece460896f_vec_speed
echo "mceliece6688128_vec:" && ./target/test_mceliece6688128_vec_speed
echo "mceliece6688128f_vec:" && ./target/test_mceliece6688128f_vec_speed
echo "mceliece6960119_vec:" && ./target/test_mceliece6960119_vec_speed
echo "mceliece6960119f_vec:" && ./target/test_mceliece6960119f_vec_speed
echo "mceliece8192128_vec:" && ./target/test_mceliece8192128_vec_speed
echo "mceliece8192128f_vec:" && ./target/test_mceliece8192128f_vec_speed

make clean
