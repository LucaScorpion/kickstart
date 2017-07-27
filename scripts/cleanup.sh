#!/bin/bash

# The packages to remove.
purge=(
	gnome-games
	default-jdk
)

# Remove the packages.
printf "Purging packages.\n"
for package in ${purge[*]}
do
	# Check if the package is installed.
	if [[ $(dpkg -s $package &> /dev/null) ]]
	then
		printf "%s $package\n" "-"
		sudo apt-get -y purge $package 1> /dev/null
	fi
done

# Clean up.
printf "\nCleaning up.\n"
sudo apt-get -y autoremove 1> /dev/null
sudo apt-get -y autoclean 1> /dev/null
