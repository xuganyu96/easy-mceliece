#include "api.h"

// TODO: unfortunately each Berlekamp-Massey implementation is distinct; I don't
// know a good way to have good abstraction
#if (MCELIECE_N == 3488)
#include "bm348864.c"
#elif (MCELIECE_N == 4608)
#include "bm460896.c"
#elif (MCELIECE_N == 6688)
#include "bm6688128.c"
#elif (MCELIECE_N == 6960)
#include "bm6960119.c"
#else
#include "bm8192128.c"
#endif
