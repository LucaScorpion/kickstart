#!/bin/bash

# Copy the user configuration.
printf "Copying user configuration.\n"
userConfig="$HOME/.config/Code/User"
if [ ! -d "$userConfig" ]
then
	mkdir -p "$userConfig"
fi
cp "$RESOURCES/vscode.json" "$userConfig/settings.json"
