#ifndef MCELIECE_N
#define MCELIECE_N 3488
#endif

#if (MCELIECE_N == 3488)
#include "gf348864.c"

#elif (MCELIECE_N == 4608)
#include "gf460896.c"

#elif (MCELIECE_N == 6688)
#include "gf6688128.c"

#elif (MCELIECE_N == 6960)
#include "gf6960119.c"

#elif (MCELIECE_N == 8192)
#include "gf8192128.c"

#else
#error "MCELIECE_N must be one of <3488|4608|6688|6960|8192>"
#endif
