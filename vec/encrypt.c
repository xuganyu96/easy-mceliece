#include "api.h"

#if (MCELIECE_N == 3488)
#include "encrypt348864.c"

#elif (MCELIECE_N == 4608)
#include "encrypt460896.c"

#elif (MCELIECE_N == 6688)
#include "encrypt6688128.c"

#elif (MCELIECE_N == 6960)
#include "encrypt6960119.c"

#elif (MCELIECE_N == 8192)
#include "encrypt8192128.c"

#endif
