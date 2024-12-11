#ifndef MCELIECE_N
#define MCELIECE_N 3488
#endif

#if (MCELIECE_N == 3488)
#include "benes348864.c"

#elif (MCELIECE_N == 4608)
#include "benes460896.c"

#elif (MCELIECE_N == 6688)
#include "benes6688128.c"

#elif (MCELIECE_N == 6960)
#include "benes6960119.c"

#elif (MCELIECE_N == 8192)
#include "benes8192128.c"

#else
#error "MCELIECE_N must be one of <3488|4608|6688|6960|8192>"
#endif
