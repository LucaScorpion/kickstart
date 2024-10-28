#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/bin"

if [ -d "$HOME/bin/cli-toolkit" ]
then
    # Update.
    echo 'Updating CLI toolkit'
    git -C "$HOME/bin/cli-toolkit" pull
else
    # Install.
    echo 'Installing CLI toolkit.'
    git clone git@github.com:LucaScorpion/cli-toolkit.git "$HOME/bin/cli-toolkit"
fi
