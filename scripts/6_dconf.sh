#!/usr/bin/env bash
set -euo pipefail

# To update a dump: `dconf dump [path]`

echo 'Loading dconf dumps:'
for file in "$RESOURCES/dconf/"*
do
    [ -f "$file" ] || continue
    name="$(basename "$file")"
    path="/$(echo "$name" | sed 's|\.|/|g')/"
    echo "- $path"
    dconf load "$path" < "$file"
done
