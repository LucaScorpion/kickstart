#!/usr/bin/env bash
set -euo pipefail

packages=(
    base-devel
    chromium
    dconf-editor
    gnome-browser-connector
    gnome-font-viewer
    go
    jq
    noto-fonts-emoji
    xclip
    yay
    zsh
    zsh-syntax-highlighting
)

echo 'Checking or installing packages:'
for package in "${packages[@]}"
do
    echo "- $package"

    if [ ! "$(pacman -Q "$package" 2> /dev/null)" ]
    then
        echo "Installing $package"
        sudo pacman -S --noconfirm "$package"
    fi
done
