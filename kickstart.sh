#!/bin/bash

# Check if sudo is installed.
if [ ! $(which sudo) ]
then
	printf "These scripts require the sudo package to be installed.\n"
	exit 1
fi

# Check if we are running as root.
if [ "$EUID" -eq 0 ]
then
	printf "This script should not be executed as root. Where necessary, sudo will be used automatically.\n"
	exit 2
fi

# Execute the helper scripts.
./scripts/packages.sh
./scripts/shell.sh
./scripts/templates.sh
./scripts/jdk.sh
./scripts/vscode.sh
./scripts/chrome.sh
./scripts/dconf.sh

# That's all folks!
printf "Done!\n"
