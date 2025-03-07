Benchmarks with tag 'apps':
===========================

| Benchmark      | clang18  | clang19                | clang19.nocg           | clang19.taildup        | clang19.tc             | gcc                    |
|----------------|:--------:|:----------------------:|:----------------------:|:----------------------:|:----------------------:|:----------------------:|
| 2to3           | 290 ms   | 302 ms: 1.04x slower   | not significant        | 286 ms: 1.01x faster   | 285 ms: 1.02x faster   | 283 ms: 1.02x faster   |
| docutils       | 2.84 sec | 2.88 sec: 1.01x slower | 2.83 sec: 1.00x faster | 2.79 sec: 1.02x faster | 2.79 sec: 1.02x faster | 2.76 sec: 1.03x faster |
| html5lib       | 65.1 ms  | 67.8 ms: 1.04x slower  | 65.5 ms: 1.01x slower  | 63.8 ms: 1.02x faster  | 64.4 ms: 1.01x faster  | 64.6 ms: 1.01x faster  |
| Geometric mean | (ref)    | 1.03x slower           | 1.00x slower           | 1.02x faster           | 1.01x faster           | 1.02x faster           |

Benchmarks with tag 'math':
===========================

| Benchmark      | clang18 | clang19               | clang19.nocg          | clang19.taildup       | clang19.tc            | gcc                   |
|----------------|:-------:|:---------------------:|:---------------------:|:---------------------:|:---------------------:|:---------------------:|
| float          | 66.4 ms | 76.5 ms: 1.15x slower | 69.5 ms: 1.05x slower | not significant       | 67.8 ms: 1.02x slower | 65.3 ms: 1.02x faster |
| nbody          | 91.5 ms | 114 ms: 1.24x slower  | 95.3 ms: 1.04x slower | 85.1 ms: 1.08x faster | 94.2 ms: 1.03x slower | 89.5 ms: 1.02x faster |
| pidigits       | 274 ms  | 275 ms: 1.00x slower  | 274 ms: 1.00x slower  | 274 ms: 1.00x slower  | not significant       | 235 ms: 1.17x faster  |
| Geometric mean | (ref)   | 1.13x slower          | 1.03x slower          | 1.02x faster          | 1.02x slower          | 1.07x faster          |

Benchmarks with tag 'regex':
============================

| Benchmark      | clang18 | clang19               | clang19.nocg          | clang19.taildup       | clang19.tc            | gcc                   |
|----------------|:-------:|:---------------------:|:---------------------:|:---------------------:|:---------------------:|:---------------------:|
| regex_compile  | 135 ms  | 148 ms: 1.10x slower  | 140 ms: 1.03x slower  | 134 ms: 1.01x faster  | 131 ms: 1.04x faster  | 129 ms: 1.05x faster  |
| regex_dna      | 212 ms  | 228 ms: 1.07x slower  | 222 ms: 1.05x slower  | 208 ms: 1.02x faster  | 215 ms: 1.01x slower  | 218 ms: 1.02x slower  |
| regex_effbot   | 3.04 ms | 2.89 ms: 1.05x faster | not significant       | 2.83 ms: 1.07x faster | 2.90 ms: 1.05x faster | 2.77 ms: 1.10x faster |
| regex_v8       | 24.8 ms | 26.4 ms: 1.07x slower | 25.8 ms: 1.04x slower | 23.8 ms: 1.04x faster | 24.6 ms: 1.00x faster | 24.5 ms: 1.01x faster |
| Geometric mean | (ref)   | 1.05x slower          | 1.03x slower          | 1.04x faster          | 1.02x faster          | 1.03x faster          |

Benchmarks with tag 'serialize':
================================

| Benchmark            | clang18  | clang19                | clang19.nocg           | clang19.taildup        | clang19.tc             | gcc                    |
|----------------------|:--------:|:----------------------:|:----------------------:|:----------------------:|:----------------------:|:----------------------:|
| json_dumps           | 11.9 ms  | 12.3 ms: 1.03x slower  | 12.0 ms: 1.01x slower  | 12.1 ms: 1.02x slower  | 11.5 ms: 1.04x faster  | 11.2 ms: 1.07x faster  |
| json_loads           | 25.6 us  | 26.4 us: 1.03x slower  | 26.7 us: 1.04x slower  | 25.5 us: 1.00x faster  | not significant        | 26.4 us: 1.03x slower  |
| pickle               | 12.2 us  | 12.4 us: 1.01x slower  | 12.6 us: 1.03x slower  | not significant        | 11.9 us: 1.02x faster  | not significant        |
| pickle_dict          | 31.2 us  | 29.9 us: 1.04x faster  | 31.1 us: 1.00x faster  | 29.9 us: 1.04x faster  | 30.7 us: 1.02x faster  | 37.1 us: 1.19x slower  |
| pickle_list          | 4.46 us  | 4.50 us: 1.01x slower  | 4.50 us: 1.01x slower  | 4.42 us: 1.01x faster  | not significant        | 5.32 us: 1.20x slower  |
| pickle_pure_python   | 323 us   | 359 us: 1.11x slower   | 335 us: 1.04x slower   | 326 us: 1.01x slower   | 312 us: 1.04x faster   | 307 us: 1.05x faster   |
| tomli_loads          | 2.06 sec | 2.50 sec: 1.21x slower | 2.24 sec: 1.09x slower | 1.97 sec: 1.04x faster | 1.94 sec: 1.06x faster | 2.02 sec: 1.02x faster |
| unpickle             | 13.7 us  | 14.1 us: 1.02x slower  | not significant        | not significant        | 13.4 us: 1.03x faster  | 13.5 us: 1.02x faster  |
| unpickle_list        | 4.84 us  | 4.67 us: 1.04x faster  | 4.65 us: 1.04x faster  | 4.59 us: 1.05x faster  | 4.68 us: 1.03x faster  | not significant        |
| unpickle_pure_python | 208 us   | 244 us: 1.17x slower   | 212 us: 1.02x slower   | 206 us: 1.01x faster   | 198 us: 1.05x faster   | 198 us: 1.05x faster   |
| xml_etree_parse      | 160 ms   | 165 ms: 1.04x slower   | 164 ms: 1.03x slower   | 165 ms: 1.04x slower   | 159 ms: 1.00x faster   | 136 ms: 1.18x faster   |
| xml_etree_iterparse  | 105 ms   | 113 ms: 1.08x slower   | 106 ms: 1.01x slower   | 104 ms: 1.01x faster   | 102 ms: 1.03x faster   | 92.2 ms: 1.14x faster  |
| xml_etree_generate   | 84.7 ms  | 92.0 ms: 1.09x slower  | not significant        | 85.7 ms: 1.01x slower  | 79.9 ms: 1.06x faster  | 78.5 ms: 1.08x faster  |
| xml_etree_process    | 59.8 ms  | 65.7 ms: 1.10x slower  | 60.2 ms: 1.01x slower  | not significant        | 55.6 ms: 1.07x faster  | 55.2 ms: 1.08x faster  |
| Geometric mean       | (ref)    | 1.06x slower           | 1.02x slower           | 1.01x faster           | 1.03x faster           | 1.02x faster           |

Benchmarks with tag 'startup':
==============================

| Benchmark              | clang18 | clang19               | clang19.nocg    | clang19.taildup       | clang19.tc            | gcc                   |
|------------------------|:-------:|:---------------------:|:---------------:|:---------------------:|:---------------------:|:---------------------:|
| python_startup         | 14.6 ms | 14.6 ms: 1.00x slower | not significant | 14.6 ms: 1.00x slower | 14.3 ms: 1.02x faster | 14.0 ms: 1.04x faster |
| python_startup_no_site | 10.4 ms | 10.4 ms: 1.00x slower | not significant | 10.4 ms: 1.01x slower | 10.3 ms: 1.01x faster | 9.98 ms: 1.04x faster |
| Geometric mean         | (ref)   | 1.00x slower          | 1.00x faster    | 1.00x slower          | 1.01x faster          | 1.04x faster          |

Benchmarks with tag 'template':
===============================

| Benchmark       | clang18 | clang19               | clang19.nocg          | clang19.taildup       | clang19.tc            | gcc                   |
|-----------------|:-------:|:---------------------:|:---------------------:|:---------------------:|:---------------------:|:---------------------:|
| django_template | 37.9 ms | 40.1 ms: 1.06x slower | not significant       | 37.4 ms: 1.01x faster | 36.5 ms: 1.04x faster | 36.5 ms: 1.04x faster |
| genshi_text     | 23.2 ms | 26.4 ms: 1.14x slower | 23.7 ms: 1.02x slower | 22.4 ms: 1.03x faster | 21.4 ms: 1.08x faster | 21.4 ms: 1.08x faster |
| genshi_xml      | 52.7 ms | 58.3 ms: 1.11x slower | 52.3 ms: 1.01x faster | not significant       | 50.3 ms: 1.05x faster | 50.2 ms: 1.05x faster |
| mako            | 11.3 ms | 12.0 ms: 1.05x slower | 11.1 ms: 1.02x faster | 11.2 ms: 1.02x faster | 10.9 ms: 1.04x faster | 10.2 ms: 1.11x faster |
| Geometric mean  | (ref)   | 1.09x slower          | 1.00x faster          | 1.02x faster          | 1.05x faster          | 1.07x faster          |

All benchmarks:
===============

| Benchmark                | clang18  | clang19                | clang19.nocg           | clang19.taildup        | clang19.tc             | gcc                    |
|--------------------------|:--------:|:----------------------:|:----------------------:|:----------------------:|:----------------------:|:----------------------:|
| 2to3                     | 290 ms   | 302 ms: 1.04x slower   | not significant        | 286 ms: 1.01x faster   | 285 ms: 1.02x faster   | 283 ms: 1.02x faster   |
| async_generators         | 474 ms   | 494 ms: 1.04x slower   | 423 ms: 1.12x faster   | 469 ms: 1.01x faster   | 422 ms: 1.12x faster   | 401 ms: 1.18x faster   |
| asyncio_tcp              | 415 ms   | 419 ms: 1.01x slower   | 413 ms: 1.01x faster   | 411 ms: 1.01x faster   | 418 ms: 1.01x slower   | 418 ms: 1.01x slower   |
| asyncio_tcp_ssl          | 1.59 sec | 1.60 sec: 1.00x slower | 1.60 sec: 1.00x slower | 1.59 sec: 1.00x faster | 1.60 sec: 1.00x slower | 1.60 sec: 1.00x slower |
| asyncio_websockets       | 439 ms   | not significant        | not significant        | 427 ms: 1.03x faster   | not significant        | not significant        |
| chaos                    | 57.5 ms  | 65.4 ms: 1.14x slower  | 59.7 ms: 1.04x slower  | 57.0 ms: 1.01x faster  | 55.9 ms: 1.03x faster  | 59.0 ms: 1.03x slower  |
| comprehensions           | 16.3 us  | 18.6 us: 1.14x slower  | 17.1 us: 1.05x slower  | not significant        | 15.1 us: 1.08x faster  | not significant        |
| bench_mp_pool            | 3.04 sec | 5.10 sec: 1.68x slower | not significant        | 1.82 sec: 1.67x faster | not significant        | not significant        |
| bench_thread_pool        | 1.18 ms  | 1.24 ms: 1.05x slower  | 1.06 ms: 1.11x faster  | 1.18 ms: 1.00x slower  | 996 us: 1.18x faster   | 1.01 ms: 1.17x faster  |
| coroutines               | 20.4 ms  | 22.2 ms: 1.09x slower  | 22.0 ms: 1.08x slower  | not significant        | 20.5 ms: 1.01x slower  | 19.6 ms: 1.04x faster  |
| coverage                 | 556 ms   | 607 ms: 1.09x slower   | 561 ms: 1.01x slower   | 575 ms: 1.04x slower   | 506 ms: 1.10x faster   | 576 ms: 1.04x slower   |
| crypto_pyaes             | 76.0 ms  | 80.2 ms: 1.05x slower  | 77.0 ms: 1.01x slower  | 76.3 ms: 1.00x slower  | 73.0 ms: 1.04x faster  | 73.2 ms: 1.04x faster  |
| dask                     | 526 ms   | 545 ms: 1.04x slower   | 541 ms: 1.03x slower   | not significant        | 517 ms: 1.02x faster   | 518 ms: 1.01x faster   |
| deepcopy                 | 260 us   | 286 us: 1.10x slower   | 276 us: 1.06x slower   | 270 us: 1.04x slower   | 255 us: 1.02x faster   | 263 us: 1.01x slower   |
| deepcopy_reduce          | 2.80 us  | 2.99 us: 1.07x slower  | 2.92 us: 1.04x slower  | not significant        | 2.72 us: 1.03x faster  | 2.70 us: 1.04x faster  |
| deepcopy_memo            | 26.3 us  | 32.9 us: 1.25x slower  | 29.6 us: 1.13x slower  | 27.3 us: 1.04x slower  | 26.1 us: 1.01x faster  | 27.0 us: 1.02x slower  |
| deltablue                | 3.12 ms  | 3.59 ms: 1.15x slower  | 3.16 ms: 1.01x slower  | 3.08 ms: 1.01x faster  | 3.06 ms: 1.02x faster  | 3.15 ms: 1.01x slower  |
| django_template          | 37.9 ms  | 40.1 ms: 1.06x slower  | not significant        | 37.4 ms: 1.01x faster  | 36.5 ms: 1.04x faster  | 36.5 ms: 1.04x faster  |
| docutils                 | 2.84 sec | 2.88 sec: 1.01x slower | 2.83 sec: 1.00x faster | 2.79 sec: 1.02x faster | 2.79 sec: 1.02x faster | 2.76 sec: 1.03x faster |
| dulwich_log              | 62.4 ms  | 63.6 ms: 1.02x slower  | 63.3 ms: 1.01x slower  | not significant        | 61.1 ms: 1.02x faster  | not significant        |
| fannkuch                 | 373 ms   | 449 ms: 1.20x slower   | 417 ms: 1.12x slower   | 391 ms: 1.05x slower   | 361 ms: 1.03x faster   | 351 ms: 1.06x faster   |
| float                    | 66.4 ms  | 76.5 ms: 1.15x slower  | 69.5 ms: 1.05x slower  | not significant        | 67.8 ms: 1.02x slower  | 65.3 ms: 1.02x faster  |
| create_gc_cycles         | 1.86 ms  | 1.87 ms: 1.00x slower  | 1.87 ms: 1.00x slower  | 1.87 ms: 1.00x slower  | 1.87 ms: 1.00x slower  | 1.79 ms: 1.04x faster  |
| gc_traversal             | 4.67 ms  | 4.68 ms: 1.00x slower  | 4.65 ms: 1.01x faster  | 4.30 ms: 1.09x faster  | 4.64 ms: 1.01x faster  | 4.44 ms: 1.05x faster  |
| generators               | 28.8 ms  | 36.0 ms: 1.25x slower  | 29.0 ms: 1.01x slower  | not significant        | 28.4 ms: 1.02x faster  | 27.2 ms: 1.06x faster  |
| genshi_text              | 23.2 ms  | 26.4 ms: 1.14x slower  | 23.7 ms: 1.02x slower  | 22.4 ms: 1.03x faster  | 21.4 ms: 1.08x faster  | 21.4 ms: 1.08x faster  |
| genshi_xml               | 52.7 ms  | 58.3 ms: 1.11x slower  | 52.3 ms: 1.01x faster  | not significant        | 50.3 ms: 1.05x faster  | 50.2 ms: 1.05x faster  |
| go                       | 122 ms   | 146 ms: 1.19x slower   | 129 ms: 1.06x slower   | 121 ms: 1.01x faster   | 122 ms: 1.00x faster   | 123 ms: 1.01x slower   |
| hexiom                   | 6.02 ms  | 7.28 ms: 1.21x slower  | 6.23 ms: 1.03x slower  | 5.99 ms: 1.00x faster  | 5.66 ms: 1.06x faster  | 5.80 ms: 1.04x faster  |
| html5lib                 | 65.1 ms  | 67.8 ms: 1.04x slower  | 65.5 ms: 1.01x slower  | 63.8 ms: 1.02x faster  | 64.4 ms: 1.01x faster  | 64.6 ms: 1.01x faster  |
| json_dumps               | 11.9 ms  | 12.3 ms: 1.03x slower  | 12.0 ms: 1.01x slower  | 12.1 ms: 1.02x slower  | 11.5 ms: 1.04x faster  | 11.2 ms: 1.07x faster  |
| json_loads               | 25.6 us  | 26.4 us: 1.03x slower  | 26.7 us: 1.04x slower  | 25.5 us: 1.00x faster  | not significant        | 26.4 us: 1.03x slower  |
| logging_format           | 6.71 us  | 6.96 us: 1.04x slower  | 6.55 us: 1.03x faster  | 6.58 us: 1.02x faster  | 6.52 us: 1.03x faster  | 6.50 us: 1.03x faster  |
| logging_silent           | 84.6 ns  | 98.0 ns: 1.16x slower  | 84.9 ns: 1.00x slower  | 82.3 ns: 1.03x faster  | 78.7 ns: 1.07x faster  | 89.2 ns: 1.05x slower  |
| logging_simple           | 6.00 us  | 6.32 us: 1.05x slower  | 5.91 us: 1.01x faster  | 5.96 us: 1.01x faster  | 5.96 us: 1.01x faster  | 5.86 us: 1.02x faster  |
| mako                     | 11.3 ms  | 12.0 ms: 1.05x slower  | 11.1 ms: 1.02x faster  | 11.2 ms: 1.02x faster  | 10.9 ms: 1.04x faster  | 10.2 ms: 1.11x faster  |
| mdp                      | 2.68 sec | 2.76 sec: 1.03x slower | 2.63 sec: 1.02x faster | 2.66 sec: 1.01x faster | 2.58 sec: 1.04x faster | 2.41 sec: 1.11x faster |
| meteor_contest           | 125 ms   | 135 ms: 1.08x slower   | 131 ms: 1.05x slower   | 130 ms: 1.04x slower   | 128 ms: 1.03x slower   | 123 ms: 1.02x faster   |
| nbody                    | 91.5 ms  | 114 ms: 1.24x slower   | 95.3 ms: 1.04x slower  | 85.1 ms: 1.08x faster  | 94.2 ms: 1.03x slower  | 89.5 ms: 1.02x faster  |
| nqueens                  | 95.5 ms  | 105 ms: 1.09x slower   | 92.1 ms: 1.04x faster  | not significant        | 86.7 ms: 1.10x faster  | 86.6 ms: 1.10x faster  |
| pathlib                  | 15.5 ms  | 15.9 ms: 1.02x slower  | 15.3 ms: 1.02x faster  | 15.4 ms: 1.01x faster  | 14.9 ms: 1.04x faster  | 14.7 ms: 1.06x faster  |
| pickle                   | 12.2 us  | 12.4 us: 1.01x slower  | 12.6 us: 1.03x slower  | not significant        | 11.9 us: 1.02x faster  | not significant        |
| pickle_dict              | 31.2 us  | 29.9 us: 1.04x faster  | 31.1 us: 1.00x faster  | 29.9 us: 1.04x faster  | 30.7 us: 1.02x faster  | 37.1 us: 1.19x slower  |
| pickle_list              | 4.46 us  | 4.50 us: 1.01x slower  | 4.50 us: 1.01x slower  | 4.42 us: 1.01x faster  | not significant        | 5.32 us: 1.20x slower  |
| pickle_pure_python       | 323 us   | 359 us: 1.11x slower   | 335 us: 1.04x slower   | 326 us: 1.01x slower   | 312 us: 1.04x faster   | 307 us: 1.05x faster   |
| pidigits                 | 274 ms   | 275 ms: 1.00x slower   | 274 ms: 1.00x slower   | 274 ms: 1.00x slower   | not significant        | 235 ms: 1.17x faster   |
| pprint_safe_repr         | 790 ms   | 884 ms: 1.12x slower   | 834 ms: 1.05x slower   | 801 ms: 1.01x slower   | 771 ms: 1.03x faster   | 728 ms: 1.09x faster   |
| pprint_pformat           | 1.61 sec | 1.80 sec: 1.11x slower | 1.70 sec: 1.05x slower | 1.64 sec: 1.01x slower | 1.57 sec: 1.03x faster | 1.48 sec: 1.09x faster |
| pyflate                  | 418 ms   | 466 ms: 1.12x slower   | 432 ms: 1.03x slower   | 411 ms: 1.02x faster   | 402 ms: 1.04x faster   | 408 ms: 1.02x faster   |
| python_startup           | 14.6 ms  | 14.6 ms: 1.00x slower  | not significant        | 14.6 ms: 1.00x slower  | 14.3 ms: 1.02x faster  | 14.0 ms: 1.04x faster  |
| python_startup_no_site   | 10.4 ms  | 10.4 ms: 1.00x slower  | not significant        | 10.4 ms: 1.01x slower  | 10.3 ms: 1.01x faster  | 9.98 ms: 1.04x faster  |
| raytrace                 | 274 ms   | 296 ms: 1.08x slower   | 262 ms: 1.05x faster   | 275 ms: 1.01x slower   | 265 ms: 1.03x faster   | 270 ms: 1.01x faster   |
| regex_compile            | 135 ms   | 148 ms: 1.10x slower   | 140 ms: 1.03x slower   | 134 ms: 1.01x faster   | 131 ms: 1.04x faster   | 129 ms: 1.05x faster   |
| regex_dna                | 212 ms   | 228 ms: 1.07x slower   | 222 ms: 1.05x slower   | 208 ms: 1.02x faster   | 215 ms: 1.01x slower   | 218 ms: 1.02x slower   |
| regex_effbot             | 3.04 ms  | 2.89 ms: 1.05x faster  | not significant        | 2.83 ms: 1.07x faster  | 2.90 ms: 1.05x faster  | 2.77 ms: 1.10x faster  |
| regex_v8                 | 24.8 ms  | 26.4 ms: 1.07x slower  | 25.8 ms: 1.04x slower  | 23.8 ms: 1.04x faster  | 24.6 ms: 1.00x faster  | 24.5 ms: 1.01x faster  |
| richards                 | 43.3 ms  | 48.8 ms: 1.13x slower  | 44.1 ms: 1.02x slower  | 41.5 ms: 1.04x faster  | 42.4 ms: 1.02x faster  | 43.7 ms: 1.01x slower  |
| richards_super           | 49.4 ms  | 54.3 ms: 1.10x slower  | 50.1 ms: 1.01x slower  | 47.4 ms: 1.04x faster  | 48.3 ms: 1.02x faster  | 49.6 ms: 1.00x slower  |
| scimark_fft              | 294 ms   | 353 ms: 1.20x slower   | 317 ms: 1.08x slower   | 293 ms: 1.01x faster   | 292 ms: 1.01x faster   | 299 ms: 1.02x slower   |
| scimark_lu               | 93.2 ms  | 112 ms: 1.20x slower   | 104 ms: 1.11x slower   | 94.0 ms: 1.01x slower  | 89.9 ms: 1.04x faster  | 92.8 ms: 1.00x faster  |
| scimark_monte_carlo      | 62.4 ms  | 74.3 ms: 1.19x slower  | 68.4 ms: 1.10x slower  | 59.6 ms: 1.05x faster  | 58.1 ms: 1.07x faster  | 60.2 ms: 1.04x faster  |
| scimark_sor              | 101 ms   | 128 ms: 1.27x slower   | 118 ms: 1.17x slower   | 98.1 ms: 1.03x faster  | 93.9 ms: 1.08x faster  | 99.2 ms: 1.02x faster  |
| scimark_sparse_mat_mult  | 4.02 ms  | 5.07 ms: 1.26x slower  | 4.55 ms: 1.13x slower  | 4.10 ms: 1.02x slower  | 4.22 ms: 1.05x slower  | 4.24 ms: 1.05x slower  |
| spectral_norm            | 79.5 ms  | 92.3 ms: 1.16x slower  | 84.4 ms: 1.06x slower  | 78.8 ms: 1.01x faster  | 75.4 ms: 1.05x faster  | 82.7 ms: 1.04x slower  |
| sqlglot_normalize        | 117 ms   | 124 ms: 1.06x slower   | 116 ms: 1.01x faster   | not significant        | 112 ms: 1.05x faster   | 112 ms: 1.05x faster   |
| sqlglot_optimize         | 58.3 ms  | 61.1 ms: 1.05x slower  | not significant        | 58.0 ms: 1.01x faster  | 56.2 ms: 1.04x faster  | 55.3 ms: 1.05x faster  |
| sqlglot_parse            | 1.33 ms  | 1.48 ms: 1.11x slower  | 1.35 ms: 1.01x slower  | 1.30 ms: 1.03x faster  | 1.27 ms: 1.04x faster  | 1.30 ms: 1.03x faster  |
| sqlglot_transpile        | 1.72 ms  | 1.87 ms: 1.09x slower  | 1.73 ms: 1.01x slower  | 1.68 ms: 1.03x faster  | 1.65 ms: 1.04x faster  | 1.69 ms: 1.02x faster  |
| sqlite_synth             | 2.70 us  | 2.81 us: 1.04x slower  | 2.72 us: 1.01x slower  | 2.68 us: 1.01x faster  | 2.68 us: 1.01x faster  | not significant        |
| sympy_expand             | 486 ms   | 509 ms: 1.05x slower   | 493 ms: 1.02x slower   | not significant        | 477 ms: 1.02x faster   | 468 ms: 1.04x faster   |
| sympy_integrate          | 22.5 ms  | 23.2 ms: 1.03x slower  | 22.6 ms: 1.01x slower  | 22.5 ms: 1.00x slower  | 22.1 ms: 1.02x faster  | 21.9 ms: 1.02x faster  |
| sympy_sum                | 147 ms   | 153 ms: 1.04x slower   | 153 ms: 1.04x slower   | 148 ms: 1.00x slower   | 146 ms: 1.01x faster   | 143 ms: 1.03x faster   |
| sympy_str                | 286 ms   | 298 ms: 1.04x slower   | 293 ms: 1.02x slower   | 285 ms: 1.00x faster   | 280 ms: 1.02x faster   | 275 ms: 1.04x faster   |
| telco                    | 8.18 ms  | 8.54 ms: 1.04x slower  | 8.47 ms: 1.04x slower  | 8.63 ms: 1.05x slower  | 7.93 ms: 1.03x faster  | 8.54 ms: 1.04x slower  |
| tomli_loads              | 2.06 sec | 2.50 sec: 1.21x slower | 2.24 sec: 1.09x slower | 1.97 sec: 1.04x faster | 1.94 sec: 1.06x faster | 2.02 sec: 1.02x faster |
| typing_runtime_protocols | 166 us   | 174 us: 1.05x slower   | not significant        | 161 us: 1.03x faster   | 160 us: 1.03x faster   | 162 us: 1.02x faster   |
| unpack_sequence          | 46.8 ns  | 55.1 ns: 1.18x slower  | 66.8 ns: 1.43x slower  | 49.7 ns: 1.06x slower  | 47.2 ns: 1.01x slower  | 52.7 ns: 1.12x slower  |
| unpickle                 | 13.7 us  | 14.1 us: 1.02x slower  | not significant        | not significant        | 13.4 us: 1.03x faster  | 13.5 us: 1.02x faster  |
| unpickle_list            | 4.84 us  | 4.67 us: 1.04x faster  | 4.65 us: 1.04x faster  | 4.59 us: 1.05x faster  | 4.68 us: 1.03x faster  | not significant        |
| unpickle_pure_python     | 208 us   | 244 us: 1.17x slower   | 212 us: 1.02x slower   | 206 us: 1.01x faster   | 198 us: 1.05x faster   | 198 us: 1.05x faster   |
| xml_etree_parse          | 160 ms   | 165 ms: 1.04x slower   | 164 ms: 1.03x slower   | 165 ms: 1.04x slower   | 159 ms: 1.00x faster   | 136 ms: 1.18x faster   |
| xml_etree_iterparse      | 105 ms   | 113 ms: 1.08x slower   | 106 ms: 1.01x slower   | 104 ms: 1.01x faster   | 102 ms: 1.03x faster   | 92.2 ms: 1.14x faster  |
| xml_etree_generate       | 84.7 ms  | 92.0 ms: 1.09x slower  | not significant        | 85.7 ms: 1.01x slower  | 79.9 ms: 1.06x faster  | 78.5 ms: 1.08x faster  |
| xml_etree_process        | 59.8 ms  | 65.7 ms: 1.10x slower  | 60.2 ms: 1.01x slower  | not significant        | 55.6 ms: 1.07x faster  | 55.2 ms: 1.08x faster  |
| Geometric mean           | (ref)    | 1.09x slower           | 1.02x slower           | 1.01x faster           | 1.03x faster           | 1.02x faster           |
