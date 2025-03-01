#!/usr/bin/env bash
set -eu

buildname=$1; shift
cd $(dirname "$0")

build=$(nix build --print-out-paths --no-link .#pybuilds."$buildname")
base=$(basename "$build")

output="runs/${buildname}-${base}.json"
mkdir -p runs/
sudo systemd-run --uid nelhage --gid nelhage --scope --slice=isolated.slice \
     pyperformance run "$@" -p "${build}/bin/python3" -o "${output}"
