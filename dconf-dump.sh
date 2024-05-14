#!/usr/bin/env bash
set -euo pipefail

# Get the base and resources directories.
baseDir=$(realpath $(dirname $0))
dconfDir="$baseDir/resources/dconf"

if [ -z "${1+x}" ]
then
    echo "Error: no dconf path given"
    echo "Usage: ./dconf-dump /dconf/directory/"
    exit 1
fi

# Get the file name, remove the first and last character, replace '/' with '.'.
name=$(echo ${1:1:-1} | sed 's|/|\.|g')
echo "$1 > $name"
dconf dump "$1" > "$dconfDir/$name"
