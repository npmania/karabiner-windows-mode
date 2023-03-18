#!/usr/bin/env zsh

setopt CSH_NULL_GLOB
set -eo pipefail

error=0

# change to working directory
cd "${1:-.}"

# format jsonnet and libsonnet files
for file in ./**/*.{j,lib}sonnet; do
    printf 'jsonnetfmt -i -- "%s"\n' "${file}"
    jsonnetfmt -i -- "${file}" || error=1
done

exit ${error}
