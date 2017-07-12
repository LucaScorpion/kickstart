#!/bin/bash

# The packages to remove.
unwanted=(
	gnome-games
)

# Remove the packages.
printf "Removing packages:\n"
for package in ${unwanted[*]}
do
	printf "%s $package\n" "-"
	sudo apt-get -y purge $package 1> /dev/null
done

# Cleaning up.
sudo apt-get -y autoremove 1> /dev/null
