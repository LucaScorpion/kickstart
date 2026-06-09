#!/usr/bin/env bash
set -euo pipefail

baseDir=$(realpath $(dirname $0))
export RESOURCES="$baseDir/resources"

# Copy all dotfiles from home to resources directory
echo 'Updating dotfiles:'

# Recursively walk every file under resources/dotfiles (null-delimited for safe filenames)
while IFS= read -r -d '' entry
do
    # Strip the resources prefix to get the path relative to dotfiles/
    rel="${entry#$RESOURCES/dotfiles/}"

    # First path segment becomes the dotfile name (prefixed with `.` in $HOME)
    top="${rel%%/*}"
    home_file="$HOME/.$top"

    # If the file is nested, append the remaining path under the dotted home dir
    [ "$rel" != "$top" ] && home_file="$home_file/${rel#*/}"

    if [ -f "$home_file" ]; then
        echo "- $rel"
        cp -f "$home_file" "$entry"
    else
        echo "  (Skipping $rel - not found in home)"
    fi
done < <(find "$RESOURCES/dotfiles" -type f -print0)
