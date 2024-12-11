#include "api.h"

#if (MCELIECE_N == 3488)
#include "fft348864/fft.c"

#elif (MCELIECE_N == 4608)
#include "fft460896/fft.c"

#elif (MCELIECE_N == 6688)
#include "fft6688128/fft.c"

#elif (MCELIECE_N == 6960)
#include "fft6960119/fft.c"

#elif (MCELIECE_N == 8192)
#include "fft8192128/fft.c"

#endif
