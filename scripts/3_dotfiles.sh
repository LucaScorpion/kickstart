#!/usr/bin/env bash
set -euo pipefail

# Copy all dotfiles to the home directory.
echo 'Copying dotfiles:'
for entry in "$RESOURCES/dotfiles/"*
do
    name=".$(basename "$entry")"

    if [ -d "$entry" ]
    then
        echo "- $name/"
        mkdir -p "$HOME/$name"
        cp -rf "$entry/." "$HOME/$name/"
    elif [ -f "$entry" ]
    then
        echo "- $name"
        [ -f "$HOME/$name" ] && cp -f "$HOME/$name" "$HOME/$name.bak"
        cp -f "$entry" "$HOME/$name"
    else
        echo "Skipping '$entry' (not a file or directory)."
    fi
done
