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

# Make sure the ~/bin directory exists.
if [ ! -d ~/bin ]
then
	mkdir ~/bin
fi

# Get the resources directory.
oldResources=$RESOURCES
export RESOURCES=$(realpath ./resources)

# Execute the helper scripts.
for file in scripts/*
do
	if [ -x "$file" ]
	then
		printf "= $file\n"
		./$file
		printf "\n"
	fi
done

# Reset the resources variable in case it was set.
export RESOURCES=$oldResources

# That's all folks!
printf "Done!\n"
