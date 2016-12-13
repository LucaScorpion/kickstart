#!/bin/bash

# The link to get the VS Code deb file from.
link="https://go.microsoft.com/fwlink/?LinkID=760868"

# Download the file.
printf "Downloading Visual Studio Code.\n"
tmpDeb="/tmp/vscode.deb"
curl -L# https://go.microsoft.com/fwlink/?LinkID=760868 > $tmpDeb

# Install it.
printf "Installing VS Code.\n"
dpkg -iG $tmpDeb > /dev/null

# Set the user settings.
printf "Setting user settings."
cp vscode.json /home/$(logname)/.config/Code/User/settings.json

# Clean up.
printf "Cleaning up.\n"
rm $tmpDeb
