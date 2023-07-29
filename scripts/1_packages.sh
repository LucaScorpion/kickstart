#!/usr/bin/env bash
set -euo pipefail

packages=(
    base-devel
    noto-fonts-emoji
    xclip
    zsh
)

echo 'Checking or installing packages:'
for package in "${packages[@]}"
do
    echo "- $package"

    if [ ! "$(pacman -Q "$package" 2> /dev/null)" ]
    then
        echo "Installing $package"
        sudo pacman -S "$package"
    fi
done