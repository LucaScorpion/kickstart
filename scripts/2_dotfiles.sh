#!/bin/bash
set -euo pipefail

# Copy all dotfiles to the home directory.
printf "Copying dotfiles:\n"
for file in "$RESOURCES/dotfiles/"*
do
    [ -f "$file" ] || continue
    name=".$(basename "$file")"
    printf "%s $name\n" "-"
    cp -f "$file" "$HOME/$name"
done
