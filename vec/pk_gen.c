#include "api.h"

#if (MCELIECE_N == 3488)
#ifdef FASTKEYGEN
#include "pk_gen348864f.c"
#else
#include "pk_gen348864.c"
#endif

#elif (MCELIECE_N == 4608)
#ifdef FASTKEYGEN
#include "pk_gen460896f.c"
#else
#include "pk_gen460896.c"
#endif

#elif (MCELIECE_N == 6688)
#ifdef FASTKEYGEN
#include "pk_gen6688128f.c"
#else
#include "pk_gen6688128.c"
#endif

#elif (MCELIECE_N == 6960)
#ifdef FASTKEYGEN
#include "pk_gen6960119f.c"
#else
#include "pk_gen6960119.c"
#endif

#elif (MCELIECE_N == 8192)
#ifdef FASTKEYGEN
#include "pk_gen8192128f.c"
#else
#include "pk_gen8192128.c"
#endif

#endif
