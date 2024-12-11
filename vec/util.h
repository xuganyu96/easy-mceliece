#include "api.h"

#if (MCELIECE_N == 3488)
#include "util348864.h"

#elif (MCELIECE_N == 4608)
#include "util460896.h"

#elif (MCELIECE_N == 6688)
#include "util6688128.h"

#elif (MCELIECE_N == 6960)
#include "util6960119.h"

#elif (MCELIECE_N == 8192)
#include "util8192128.h"

#endif
