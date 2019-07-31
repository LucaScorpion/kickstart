#!/bin/bash
set -euo pipefail

# Copy the user configuration.
printf "Copying user configuration.\n"
userConfig="$HOME/.config/Code/User"
if [ -d "$userConfig" ]
then
	cp "$RESOURCES/vscode.json" "$userConfig/settings.json"
else
	printf 'Could not find Code settings directory, skipping...\n'
fi
