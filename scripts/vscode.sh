#!/bin/bash

# Check if VS Code is already installed.
if [ $(which code) ]
then
	printf "Visual Studio Code is already installed, skipping.\n"
else
	# The link to get the VS Code deb file from.
	link="https://go.microsoft.com/fwlink/?LinkID=760868"

	# Download the file.
	printf "Downloading Visual Studio Code.\n"
	tmpDeb="/tmp/vscode.deb"
	curl -L# https://go.microsoft.com/fwlink/?LinkID=760868 > $tmpDeb

	# Install it.
	printf "Installing VS Code.\n"
	sudo dpkg -iG $tmpDeb > /dev/null

	# Clean up.
	printf "Cleaning up.\n"
	rm $tmpDeb
fi

# Set the user settings.
printf "Setting user settings.\n"
userConfig="$HOME/.config/Code/User"
if [ ! -d "$userConfig" ]
then
	mkdir -p $userConfig
fi
cp $RESOURCES/vscode.json $userConfig/settings.json
