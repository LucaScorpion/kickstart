#!/bin/bash

# Check if sudo is installed.
if [ ! $(which sudo) ]
then
	printf "These scripts require the sudo package to be installed.\n"
	exit 1
fi

# Check if we are running as root.
if (( "$EUID" == 0 ))
then
	printf "This script should not be executed as root. Where necessary, sudo will be used.\n"
	exit 2
fi

# Parse options.
while (( $# > 0 ))
do
	case "$1" in
		# Print help text.
		-h|--help)
			printf "\
Debian-kickstart
Usage: ./kickstart.sh
Options:
	-h, --help		Print this help text.
"
			exit
			;;
		# Invalid options.
		*)
			printf "Invalid option: $1\n"
			exit 3
	esac
	shift
done

# Make sure the ~/bin directory exists.
if [ ! -d "$HOME/bin" ]
then
	mkdir "$HOME/bin"
fi

# Get the resources directory.
oldResources=$RESOURCES
export RESOURCES=$(realpath ./resources)

# Get some colors.
normal=$(tput sgr0)
blue=$(tput setaf 14)

# Execute the helper scripts.
for file in scripts/*
do
	if [ -x "$file" ]
	then
		printf "${blue}= $(basename $file)$normal\n"
		"./$file" $@
		printf "\n"
	fi
done

# Reset the resources variable in case it was set.
export RESOURCES=$oldResources

# That's all folks!
printf "Done!\n"
