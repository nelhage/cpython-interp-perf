Benchmarks with tag 'apps':
===========================

| Benchmark      | clang18  | clang19                | clang19.taildup        | clang19.tc             |
|----------------|:--------:|:----------------------:|:----------------------:|:----------------------:|
| 2to3           | 151 ms   | 166 ms: 1.10x slower   | 152 ms: 1.01x slower   | 152 ms: 1.01x slower   |
| docutils       | 1.38 sec | 1.47 sec: 1.06x slower | 1.40 sec: 1.01x slower | 1.39 sec: 1.00x slower |
| html5lib       | 29.7 ms  | 33.1 ms: 1.12x slower  | 30.1 ms: 1.01x slower  | not significant        |
| Geometric mean | (ref)    | 1.09x slower           | 1.01x slower           | 1.00x slower           |

Benchmarks with tag 'math':
===========================

| Benchmark      | clang18 | clang19               | clang19.taildup       | clang19.tc            |
|----------------|:-------:|:---------------------:|:---------------------:|:---------------------:|
| float          | 44.3 ms | 51.5 ms: 1.16x slower | not significant       | 45.4 ms: 1.03x slower |
| nbody          | 61.5 ms | 85.7 ms: 1.39x slower | 60.2 ms: 1.02x faster | 64.8 ms: 1.05x slower |
| pidigits       | 285 ms  | not significant       | 287 ms: 1.01x slower  | not significant       |
| Geometric mean | (ref)   | 1.18x slower          | 1.01x faster          | 1.03x slower          |

Benchmarks with tag 'regex':
============================

| Benchmark      | clang18 | clang19               | clang19.taildup       | clang19.tc            |
|----------------|:-------:|:---------------------:|:---------------------:|:---------------------:|
| regex_compile  | 63.2 ms | 76.2 ms: 1.21x slower | 65.2 ms: 1.03x slower | 64.3 ms: 1.02x slower |
| regex_dna      | 144 ms  | 142 ms: 1.01x faster  | 140 ms: 1.03x faster  | 142 ms: 1.01x faster  |
| regex_effbot   | 2.16 ms | 2.13 ms: 1.01x faster | 2.14 ms: 1.01x faster | 2.12 ms: 1.02x faster |
| regex_v8       | 17.5 ms | 17.7 ms: 1.01x slower | 16.9 ms: 1.04x faster | 17.4 ms: 1.01x faster |
| Geometric mean | (ref)   | 1.04x slower          | 1.01x faster          | 1.01x faster          |

Benchmarks with tag 'serialize':
================================

| Benchmark            | clang18  | clang19                | clang19.taildup        | clang19.tc             |
|----------------------|:--------:|:----------------------:|:----------------------:|:----------------------:|
| json_dumps           | 7.41 ms  | 7.74 ms: 1.05x slower  | 7.50 ms: 1.01x slower  | 7.49 ms: 1.01x slower  |
| json_loads           | 17.8 us  | 18.0 us: 1.01x slower  | 18.6 us: 1.05x slower  | 17.7 us: 1.00x faster  |
| pickle               | 9.58 us  | not significant        | not significant        | 9.52 us: 1.01x faster  |
| pickle_list          | 3.18 us  | 3.16 us: 1.01x faster  | 3.11 us: 1.02x faster  | 3.13 us: 1.02x faster  |
| pickle_pure_python   | 189 us   | 224 us: 1.19x slower   | 193 us: 1.02x slower   | 192 us: 1.01x slower   |
| tomli_loads          | 1.17 sec | 1.50 sec: 1.27x slower | 1.20 sec: 1.03x slower | 1.18 sec: 1.01x slower |
| unpickle             | 9.08 us  | 9.16 us: 1.01x slower  | 9.19 us: 1.01x slower  | not significant        |
| unpickle_list        | 2.99 us  | 3.01 us: 1.01x slower  | 3.01 us: 1.01x slower  | 3.01 us: 1.01x slower  |
| unpickle_pure_python | 129 us   | 160 us: 1.24x slower   | 137 us: 1.06x slower   | 127 us: 1.02x faster   |
| xml_etree_parse      | 95.9 ms  | 97.8 ms: 1.02x slower  | 98.6 ms: 1.03x slower  | 97.2 ms: 1.01x slower  |
| xml_etree_iterparse  | 66.5 ms  | 69.6 ms: 1.05x slower  | 70.5 ms: 1.06x slower  | 65.6 ms: 1.01x faster  |
| xml_etree_generate   | 51.3 ms  | 56.5 ms: 1.10x slower  | 52.9 ms: 1.03x slower  | 50.7 ms: 1.01x faster  |
| xml_etree_process    | 36.2 ms  | 41.2 ms: 1.14x slower  | 37.7 ms: 1.04x slower  | 35.3 ms: 1.03x faster  |
| Geometric mean       | (ref)    | 1.07x slower           | 1.02x slower           | 1.00x faster           |

Benchmark hidden because not significant (1): pickle_dict

Benchmarks with tag 'startup':
==============================

| Benchmark      | clang18 | clang19               | clang19.taildup       | clang19.tc      |
|----------------|:-------:|:---------------------:|:---------------------:|:---------------:|
| python_startup | 11.2 ms | 11.4 ms: 1.01x slower | 11.2 ms: 1.00x faster | not significant |
| Geometric mean | (ref)   | 1.01x slower          | 1.00x slower          | 1.00x faster    |

Benchmark hidden because not significant (1): python_startup_no_site

Benchmarks with tag 'template':
===============================

| Benchmark       | clang18 | clang19               | clang19.taildup       | clang19.tc            |
|-----------------|:-------:|:---------------------:|:---------------------:|:---------------------:|
| django_template | 20.0 ms | 23.4 ms: 1.17x slower | 20.8 ms: 1.04x slower | not significant       |
| genshi_text     | 13.0 ms | 15.5 ms: 1.19x slower | 13.3 ms: 1.03x slower | not significant       |
| genshi_xml      | 27.7 ms | 33.1 ms: 1.20x slower | 28.3 ms: 1.02x slower | 27.4 ms: 1.01x faster |
| mako            | 7.13 ms | 8.17 ms: 1.15x slower | 7.38 ms: 1.03x slower | 7.26 ms: 1.02x slower |
| Geometric mean  | (ref)   | 1.18x slower          | 1.03x slower          | 1.00x faster          |

All benchmarks:
===============

| Benchmark                | clang18  | clang19                | clang19.taildup        | clang19.tc             |
|--------------------------|:--------:|:----------------------:|:----------------------:|:----------------------:|
| 2to3                     | 151 ms   | 166 ms: 1.10x slower   | 152 ms: 1.01x slower   | 152 ms: 1.01x slower   |
| async_generators         | 244 ms   | 266 ms: 1.09x slower   | 252 ms: 1.03x slower   | 246 ms: 1.01x slower   |
| asyncio_tcp              | 439 ms   | 410 ms: 1.07x faster   | not significant        | 413 ms: 1.06x faster   |
| asyncio_websockets       | 321 ms   | not significant        | not significant        | 320 ms: 1.00x faster   |
| chaos                    | 35.8 ms  | 41.3 ms: 1.16x slower  | 35.3 ms: 1.01x faster  | 36.0 ms: 1.01x slower  |
| comprehensions           | 9.95 us  | 12.1 us: 1.21x slower  | 9.92 us: 1.00x faster  | 10.1 us: 1.01x slower  |
| bench_mp_pool            | 44.8 ms  | 45.5 ms: 1.02x slower  | not significant        | 45.0 ms: 1.00x slower  |
| bench_thread_pool        | 443 us   | 491 us: 1.11x slower   | not significant        | not significant        |
| coroutines               | 15.6 ms  | 16.9 ms: 1.08x slower  | 15.0 ms: 1.04x faster  | 15.2 ms: 1.02x faster  |
| coverage                 | 46.3 ms  | 47.6 ms: 1.03x slower  | 46.9 ms: 1.01x slower  | 48.1 ms: 1.04x slower  |
| crypto_pyaes             | 54.2 ms  | 54.8 ms: 1.01x slower  | 50.2 ms: 1.08x faster  | 50.5 ms: 1.07x faster  |
| dask                     | 207 ms   | 219 ms: 1.06x slower   | not significant        | not significant        |
| deepcopy                 | 144 us   | 179 us: 1.25x slower   | 148 us: 1.03x slower   | 143 us: 1.00x faster   |
| deepcopy_reduce          | 1.53 us  | 1.80 us: 1.18x slower  | 1.55 us: 1.01x slower  | not significant        |
| deepcopy_memo            | 17.1 us  | 22.2 us: 1.30x slower  | 17.5 us: 1.02x slower  | 16.8 us: 1.02x faster  |
| deltablue                | 1.96 ms  | 2.40 ms: 1.22x slower  | 2.06 ms: 1.05x slower  | 2.09 ms: 1.07x slower  |
| django_template          | 20.0 ms  | 23.4 ms: 1.17x slower  | 20.8 ms: 1.04x slower  | not significant        |
| docutils                 | 1.38 sec | 1.47 sec: 1.06x slower | 1.40 sec: 1.01x slower | 1.39 sec: 1.00x slower |
| dulwich_log              | 27.6 ms  | 29.5 ms: 1.07x slower  | 28.4 ms: 1.03x slower  | 27.7 ms: 1.01x slower  |
| fannkuch                 | 256 ms   | 297 ms: 1.16x slower   | not significant        | 259 ms: 1.01x slower   |
| float                    | 44.3 ms  | 51.5 ms: 1.16x slower  | not significant        | 45.4 ms: 1.03x slower  |
| create_gc_cycles         | 925 us   | 905 us: 1.02x faster   | not significant        | 913 us: 1.01x faster   |
| gc_traversal             | 2.60 ms  | 2.59 ms: 1.00x faster  | 2.61 ms: 1.00x slower  | 2.60 ms: 1.00x faster  |
| generators               | 21.0 ms  | 24.2 ms: 1.15x slower  | 20.9 ms: 1.00x faster  | 18.2 ms: 1.15x faster  |
| genshi_text              | 13.0 ms  | 15.5 ms: 1.19x slower  | 13.3 ms: 1.03x slower  | not significant        |
| genshi_xml               | 27.7 ms  | 33.1 ms: 1.20x slower  | 28.3 ms: 1.02x slower  | 27.4 ms: 1.01x faster  |
| go                       | 71.3 ms  | 89.3 ms: 1.25x slower  | 72.6 ms: 1.02x slower  | 72.4 ms: 1.02x slower  |
| hexiom                   | 3.83 ms  | 4.77 ms: 1.25x slower  | 3.89 ms: 1.02x slower  | 3.86 ms: 1.01x slower  |
| html5lib                 | 29.7 ms  | 33.1 ms: 1.12x slower  | 30.1 ms: 1.01x slower  | not significant        |
| json_dumps               | 7.41 ms  | 7.74 ms: 1.05x slower  | 7.50 ms: 1.01x slower  | 7.49 ms: 1.01x slower  |
| json_loads               | 17.8 us  | 18.0 us: 1.01x slower  | 18.6 us: 1.05x slower  | 17.7 us: 1.00x faster  |
| logging_format           | 3.30 us  | 3.74 us: 1.13x slower  | 3.40 us: 1.03x slower  | not significant        |
| logging_silent           | 56.2 ns  | 75.7 ns: 1.35x slower  | 58.1 ns: 1.03x slower  | 59.3 ns: 1.06x slower  |
| logging_simple           | 3.01 us  | 3.45 us: 1.14x slower  | 3.11 us: 1.03x slower  | not significant        |
| mako                     | 7.13 ms  | 8.17 ms: 1.15x slower  | 7.38 ms: 1.03x slower  | 7.26 ms: 1.02x slower  |
| mdp                      | 1.62 sec | 1.72 sec: 1.06x slower | 1.61 sec: 1.01x faster | 1.60 sec: 1.01x faster |
| meteor_contest           | 72.0 ms  | 79.1 ms: 1.10x slower  | 72.1 ms: 1.00x slower  | 71.5 ms: 1.01x faster  |
| nbody                    | 61.5 ms  | 85.7 ms: 1.39x slower  | 60.2 ms: 1.02x faster  | 64.8 ms: 1.05x slower  |
| nqueens                  | 53.7 ms  | 60.9 ms: 1.13x slower  | 55.4 ms: 1.03x slower  | 52.8 ms: 1.02x faster  |
| pathlib                  | 16.5 ms  | 17.1 ms: 1.04x slower  | 16.6 ms: 1.01x slower  | not significant        |
| pickle                   | 9.58 us  | not significant        | not significant        | 9.52 us: 1.01x faster  |
| pickle_list              | 3.18 us  | 3.16 us: 1.01x faster  | 3.11 us: 1.02x faster  | 3.13 us: 1.02x faster  |
| pickle_pure_python       | 189 us   | 224 us: 1.19x slower   | 193 us: 1.02x slower   | 192 us: 1.01x slower   |
| pidigits                 | 285 ms   | not significant        | 287 ms: 1.01x slower   | not significant        |
| pprint_safe_repr         | 440 ms   | 553 ms: 1.26x slower   | 458 ms: 1.04x slower   | 447 ms: 1.02x slower   |
| pprint_pformat           | 886 ms   | 1.12 sec: 1.27x slower | 937 ms: 1.06x slower   | 923 ms: 1.04x slower   |
| pyflate                  | 300 ms   | 335 ms: 1.11x slower   | 305 ms: 1.02x slower   | 304 ms: 1.01x slower   |
| python_startup           | 11.2 ms  | 11.4 ms: 1.01x slower  | 11.2 ms: 1.00x faster  | not significant        |
| raytrace                 | 159 ms   | 185 ms: 1.17x slower   | 162 ms: 1.02x slower   | 166 ms: 1.05x slower   |
| regex_compile            | 63.2 ms  | 76.2 ms: 1.21x slower  | 65.2 ms: 1.03x slower  | 64.3 ms: 1.02x slower  |
| regex_dna                | 144 ms   | 142 ms: 1.01x faster   | 140 ms: 1.03x faster   | 142 ms: 1.01x faster   |
| regex_effbot             | 2.16 ms  | 2.13 ms: 1.01x faster  | 2.14 ms: 1.01x faster  | 2.12 ms: 1.02x faster  |
| regex_v8                 | 17.5 ms  | 17.7 ms: 1.01x slower  | 16.9 ms: 1.04x faster  | 17.4 ms: 1.01x faster  |
| richards                 | 27.9 ms  | 33.6 ms: 1.20x slower  | 29.2 ms: 1.05x slower  | 29.1 ms: 1.04x slower  |
| richards_super           | 31.2 ms  | 37.1 ms: 1.19x slower  | 32.5 ms: 1.04x slower  | 32.8 ms: 1.05x slower  |
| scimark_fft              | 192 ms   | 224 ms: 1.17x slower   | 187 ms: 1.03x faster   | 195 ms: 1.02x slower   |
| scimark_lu               | 77.6 ms  | 83.9 ms: 1.08x slower  | 85.0 ms: 1.10x slower  | 74.5 ms: 1.04x faster  |
| scimark_monte_carlo      | 42.0 ms  | 49.4 ms: 1.18x slower  | 41.1 ms: 1.02x faster  | not significant        |
| scimark_sor              | 73.7 ms  | 89.1 ms: 1.21x slower  | 71.7 ms: 1.03x faster  | 76.7 ms: 1.04x slower  |
| scimark_sparse_mat_mult  | 2.87 ms  | 3.04 ms: 1.06x slower  | 2.78 ms: 1.03x faster  | 2.92 ms: 1.02x slower  |
| spectral_norm            | 66.4 ms  | 74.3 ms: 1.12x slower  | 66.2 ms: 1.00x faster  | 70.1 ms: 1.06x slower  |
| sqlglot_normalize        | 169 ms   | 192 ms: 1.14x slower   | 185 ms: 1.09x slower   | not significant        |
| sqlglot_optimize         | 31.1 ms  | 35.2 ms: 1.13x slower  | 33.5 ms: 1.08x slower  | not significant        |
| sqlglot_parse            | 712 us   | 840 us: 1.18x slower   | 753 us: 1.06x slower   | 716 us: 1.01x slower   |
| sqlglot_transpile        | 870 us   | 1.02 ms: 1.18x slower  | 894 us: 1.03x slower   | 877 us: 1.01x slower   |
| sqlite_synth             | 1.54 us  | 1.58 us: 1.02x slower  | 1.53 us: 1.00x faster  | 1.55 us: 1.01x slower  |
| sympy_expand             | 224 ms   | 251 ms: 1.12x slower   | 231 ms: 1.03x slower   | 227 ms: 1.01x slower   |
| sympy_integrate          | 10.7 ms  | 11.3 ms: 1.05x slower  | 10.5 ms: 1.03x faster  | 10.5 ms: 1.02x faster  |
| sympy_sum                | 71.1 ms  | 79.4 ms: 1.12x slower  | 72.5 ms: 1.02x slower  | 71.7 ms: 1.01x slower  |
| sympy_str                | 133 ms   | 150 ms: 1.12x slower   | 135 ms: 1.01x slower   | 134 ms: 1.01x slower   |
| telco                    | 4.67 ms  | 4.97 ms: 1.06x slower  | not significant        | 4.71 ms: 1.01x slower  |
| tomli_loads              | 1.17 sec | 1.50 sec: 1.27x slower | 1.20 sec: 1.03x slower | 1.18 sec: 1.01x slower |
| typing_runtime_protocols | 87.2 us  | 100.0 us: 1.15x slower | 89.4 us: 1.03x slower  | 89.2 us: 1.02x slower  |
| unpack_sequence          | 32.6 ns  | 50.9 ns: 1.56x slower  | 51.7 ns: 1.58x slower  | 34.7 ns: 1.06x slower  |
| unpickle                 | 9.08 us  | 9.16 us: 1.01x slower  | 9.19 us: 1.01x slower  | not significant        |
| unpickle_list            | 2.99 us  | 3.01 us: 1.01x slower  | 3.01 us: 1.01x slower  | 3.01 us: 1.01x slower  |
| unpickle_pure_python     | 129 us   | 160 us: 1.24x slower   | 137 us: 1.06x slower   | 127 us: 1.02x faster   |
| xml_etree_parse          | 95.9 ms  | 97.8 ms: 1.02x slower  | 98.6 ms: 1.03x slower  | 97.2 ms: 1.01x slower  |
| xml_etree_iterparse      | 66.5 ms  | 69.6 ms: 1.05x slower  | 70.5 ms: 1.06x slower  | 65.6 ms: 1.01x faster  |
| xml_etree_generate       | 51.3 ms  | 56.5 ms: 1.10x slower  | 52.9 ms: 1.03x slower  | 50.7 ms: 1.01x faster  |
| xml_etree_process        | 36.2 ms  | 41.2 ms: 1.14x slower  | 37.7 ms: 1.04x slower  | 35.3 ms: 1.03x faster  |
| Geometric mean           | (ref)    | 1.12x slower           | 1.02x slower           | 1.00x slower           |

Benchmark hidden because not significant (3): asyncio_tcp_ssl, pickle_dict, python_startup_no_site
