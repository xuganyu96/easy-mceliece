- [ ] `vec` is currenly terribly ugly

# Easy McEliece
Extremely portable classic McEliece implementation. `ref` contains the reference implementation, where as `vec` contains optimized (though still portable) implementation.

# Getting started
Start by running the correctness tests and speed tests:

```bash
make tests speed
```

# Performance
Performance measured on Apple Silicon M1 using CPU clock.

|name|keygen|enc|dec|
|---|---:|---:|---:|
|mceliece348864|1674503|461|464822|
|mceliece348864vec|1105284|271|2381|
|mceliece348864f|785128|480|464367|
|mceliece348864fvec|693990|243|2378|
|mceliece460896|5308671|735|1118850|
|mceliece460896vec|3317765|536|6589|
|mceliece460896f|2240253|734|1119706|
|mceliece460896fvec|2177109|569|6596|
|mceliece6688128|10724534|1588|2152209|
|mceliece6688128vec|6174239|878|7467|
|mceliece6688128f|4164644|1653|2152457|
|mceliece6688128fvec|4209949|820|7475|
|mceliece6960119|12770256|15435|2084527|
|mceliece6960119vec|5479011|727|7294|
|mceliece6960119f|3957459|15525|2083846|
|mceliece6960119fvec|3901054|710|7264|
|mceliece8192128|10033974|1558|2635988|
|mceliece8192128vec|7793241|888|7464|
|mceliece8192128f|4493157|1438|2635243|
|mceliece8192128fvec|4240067|920|7452|
