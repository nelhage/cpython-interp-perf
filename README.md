# Performance testing for CPython and clang

This repository contains [nix][nix] configuration to build CPython
against various versions of GCC and clang/LLVM, using various
configuration options. I used this to explore the performance of [the
new tail-call interpreter][tailcall] and to explore the impact of [an
LLVM regression I found][regression] starting with LLVM 19.

[nix]: https://nixos.org/
[tailcall]: https://github.com/python/cpython/pull/128718

## Results

See [data](data/) for the raw data and full comparisons.

I benchmarked several configurations, on both an Intel server (a
[Raptor Lake i5-13500][intel] I maintain in Hetzner), and on my Apple
M1 Macbook Air.

[intel]: https://www.intel.com/content/www/us/en/products/sku/230580/intel-core-i513500-processor-24m-cache-up-to-4-80-ghz/specifications.html
[nix-config]: https://github.com/nelhage/cpython-interp-perf/

These configurations are:
- `clang18`: Built using clang 18.1.8, using computed gotos.
- `gcc` (Intel only): Built with GCC 14.2.1, using computed gotos.
- `clang19`: Built using clang 19.1.7, using compute gotos.
- `clang19.tc`: Built using clang 19.1.7, using the new tail-call interpreter.
- `clang19.taildup`: Built using clang 19.1.7, computed gotos and some magic `-mllvm` options which work around the regression.

All builds use LTO and PGO.

| Platform             | clang18 | clang19      | clang19.taildup | clang19.tc   | gcc          |
|----------------------|---------|--------------|-----------------|--------------|--------------|
| Raptor Lake i5-13500 | (ref)   | 1.09x slower | 1.01x faster    | 1.03x faster | 1.02x faster |
| Apple M1 Macbook Air | (ref)   | 1.12x slower | 1.02x slower    | 1.00x slower | N/A          |

Based on these results, I conclude that the tail-call interpreter
represents a small (1-2%) speedup relative to the computed-goto
interpreter, **except** for the fact that clang 19 (and 20) contain a
[regression][clang-bug] that merges the computed gotos too-eagerly,
which incurs a ~10% performance impact(!)

[clang-bug]: https://github.com/llvm/llvm-project/issues/106846
