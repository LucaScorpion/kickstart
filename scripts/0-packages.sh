#!/bin/bash

# Update the package list and upgrade packages.
printf "Updating package list.\n"
sudo apt-get -q update
printf "\nUpgrading packages.\n"
sudo apt-get -qy upgrade

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
	if [[ ! $(dpkg -s $package) ]]
	then
		printf "%s $package\n" "-"
		sudo apt-get -qy install $package
	fi
done < "$RESOURCES/packages"
