#include "api.h"

#if (MCELIECE_N == 3488)
#include "decrypt348864.c"

#elif (MCELIECE_N == 4608)
#include "decrypt460896.c"

#elif (MCELIECE_N == 6688)
#include "decrypt6688128.c"

#elif (MCELIECE_N == 6960)
#include "decrypt6960119.c"

#elif (MCELIECE_N == 8192)
#include "decrypt8192128.c"

#endif
