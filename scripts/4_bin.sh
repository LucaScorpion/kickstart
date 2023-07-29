#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/bin"

# Copy all bin scripts to ~/bin.
echo 'Copying bin scripts:'
for file in "$RESOURCES/bin/"*
do
    [ -f "$file" ] || continue
    name="$(basename "$file")"
    echo "- $name"
    cp -f "$file" "$HOME/bin/$name"
done
