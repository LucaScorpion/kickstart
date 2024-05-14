#!/usr/bin/env bash
set -euo pipefail

echo 'Loading dconf dumps:'
for file in "$RESOURCES/dconf/"*
do
    [ -f "$file" ] || continue
    name="$(basename "$file")"
    path="/$(echo "$name" | sed 's|\.|/|g')/"
    echo "- $path"
    dconf load "$path" < "$file"
done
