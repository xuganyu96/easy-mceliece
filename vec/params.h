#ifndef PARAMS_H
#define PARAMS_H
#include "api.h"

#if (MCELIECE_N == 3488)
#define GFBITS 12
#define SYS_N 3488
#define SYS_T 64
#elif (MCELIECE_N == 4608)
#define GFBITS 13
#define SYS_N 4608
#define SYS_T 96
#elif (MCELIECE_N == 6688)
#define GFBITS 13
#define SYS_N 6688
#define SYS_T 128
#elif (MCELIECE_N == 6960)
#define GFBITS 13
#define SYS_N 6960
#define SYS_T 119
#else
#define GFBITS 13
#define SYS_N 8192
#define SYS_T 128
#endif

#define COND_BYTES ((1 << (GFBITS - 4)) * (2 * GFBITS - 1))
#define IRR_BYTES (SYS_T * 2)

#define PK_NROWS (SYS_T * GFBITS)
#define PK_NCOLS (SYS_N - PK_NROWS)
#define PK_ROW_BYTES ((PK_NCOLS + 7) / 8)

#define SYND_BYTES ((PK_NROWS + 7) / 8)

#define GFMASK ((1 << GFBITS) - 1)

#endif
