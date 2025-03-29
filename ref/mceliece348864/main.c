#include "gf.h"
#include "params.h"
#include "randombytes.h"
#include "sk_gen.h"
#include <stdio.h>
#include <stdint.h>

/**
 * Return a random element in the Galois Field
 */
static gf random_gf() {
  gf rand;
  randombytes((void *)&rand, 2);
  rand = rand & GFMASK;
  return rand;
}

/**
 * Print the elements in a extension field
 */
static void print_GF(gf *arr, size_t arrlen) {
  printf("[");
  for (size_t i = 0; i < arrlen; i++) {
    printf("GF2p12(0x%04X)", arr[i]);
    if (i < arrlen - 1) printf(", ");
  }
  printf("]");
}

/**
 * print a number of randomly generated multiplications
 */
static void print_random_gf_mul(size_t ntests) {
  printf(">>>>>>>> random gf_mul <<<<<<<\n");
  gf lhs, rhs, prod;
  for (int i = 0; i < ntests; i++) {
    lhs = random_gf();
    rhs = random_gf();
    prod = gf_mul(lhs, rhs);
    printf(
        "assert_eq!(GF2p12(0x%04X).gf_mul(&GF2p12(0x%04X)), GF2p12(0x%04X));\n",
        lhs, rhs, prod);
  }
  printf("\n");
}

static void print_random_GF_mul(size_t ntests) {
  printf(">>>>>>>> random GF_mul <<<<<<<\n");
  gf lhs[SYS_T], rhs[SYS_T], prod[SYS_T];
  for (size_t i = 0; i < SYS_T; i++) {
    lhs[i] = random_gf();
    rhs[i] = random_gf();
  }
  GF_mul(prod, lhs, rhs);
  printf("let lhs = GF2p12p64("); print_GF(lhs, SYS_T);printf(");\n");
  printf("let rhs = GF2p12p64("); print_GF(rhs, SYS_T);printf(");\n");
  printf("let prod = GF2p12p64("); print_GF(prod, SYS_T);printf(");\n");
  printf("\n");
}

int main(void) {
  print_random_gf_mul(10);
  print_random_GF_mul(1);

  printf(">>>>>>>> Irreducible <<<<<<<\n");
  gf extfield_elem[SYS_T], irr[SYS_T];
  for (int i = 0; i < SYS_T; i++) extfield_elem[i] = random_gf();
  int fail = genpoly_gen(irr, extfield_elem);
  if (!fail) {
    printf("let input = GF2p12p64("); print_GF(extfield_elem, SYS_T);printf(");\n");
    printf("let output = "); print_GF(irr, SYS_T);printf(";\n");
  }

  return 0;
}
