#!/bin/bash

# Read the packages to install from the resources/packages file.
readarray packages < "$RESOURCES/packages"

# Update the package list and upgrade packages.
printf "Updating package list.\n"
sudo apt-get -q update
printf "\nUpgrading packages.\n"
sudo apt-get -qy upgrade

# Install the packages.
printf "\nInstalling packages.\n"
for package in ${packages[*]}
do
	# Check if the package is already installed.
	if [[ ! $(dpkg -s $package) ]]
	then
		printf "%s $package\n" "-"
		sudo apt-get -qy install $package
	fi
done
