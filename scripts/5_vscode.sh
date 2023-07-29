#!/usr/bin/env bash
set -euo pipefail

# Copy the user configuration.
echo 'Copying user configuration.'
userConfig="$HOME/.config/Code - OSS/User"
if [ -d "$userConfig" ]
then
	cp "$RESOURCES/vscode.json" "$userConfig/settings.json"
else
	echo 'Could not find Code settings directory, skipping...'
fi
