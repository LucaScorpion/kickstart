#!/bin/bash

# Update the system.
printf "Upgrading system.\n"
sudo pacman -Syu

# Install the packages.
printf "\nInstalling packages.\n"
while read -r package
do
	# Check if the line is a comment or empty.
	case "$package" in
		"" | \#*)
			continue
	esac

	# Check if the package is already installed.
	if [[ ! $(pacman -Qi $package) ]]
	then
		printf "%s $package\n" "-"
		sudo apt-get -qy install $package
	fi
done < "$RESOURCES/packages"
