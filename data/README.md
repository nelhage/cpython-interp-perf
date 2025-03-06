Benchmark results from this repository. Benchmark machines:

- `x86_64-linux`: An Intel [Raptor Lake i5-13500][intel] server.
- `aarch64_darwin`: My M1 Macbook Air

I've renamed the builds here to make the rendered output easier to
read. The mapping (from names in this tree to build names in
`python.nix`) is as follows:

- `clang18`: `clang18`
- `clang19`: `clang19`
- `clang19.taildup`: `clang19taildup`
- `clang19.tc`: `clang19TCnozero`
- `gcc`: `optLTO`

[intel]: https://www.intel.com/content/www/us/en/products/sku/230580/intel-core-i513500-processor-24m-cache-up-to-4-80-ghz/specifications.html
