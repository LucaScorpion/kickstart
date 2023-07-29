#!/usr/bin/env bash
set -euo pipefail

# Copy all dotfiles to the home directory.
echo 'Copying dotfiles:'
for file in "$RESOURCES/dotfiles/"*
do
    [ -f "$file" ] || continue
    name=".$(basename "$file")"
    echo "- $name"
    [ -f "$HOME/$name" ] && cp -f "$HOME/$name" "$HOME/$name.bak"
    cp -f "$file" "$HOME/$name"
done
