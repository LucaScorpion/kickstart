#!/usr/bin/env bash
set -euo pipefail

# To update a dump: `dconf dump [path]`

echo 'Loading dconf dumps:'

echo '- gnome-terminal-profiles'
dconf load '/org/gnome/terminal/legacy/profiles:/' < "$RESOURCES/dconf/gnome-terminal-profiles.dconf"
