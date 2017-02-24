#!/bin/bash

# The packages to install.
packages=(git curl screenfetch filezilla gimp bless qbittorrent java-package fonts-powerline apt-transport-https)

# Set the sources.list file to contain all the standard repos.
printf "Updating sources.list (a backup will be created).\n"
sourcesFile="/etc/apt/sources.list"
sudo mv $sourcesFile "$sourcesFile.bak"
sudo cp ../resources/sources.list $sourcesFile

# Update the package list and upgrade packages.
printf "Updating package list and upgrading packages.\n"
sudo apt update > /dev/null
sudo apt -y upgrade > /dev/null

# Install the packages.
printf "Installing packages:\n"
for package in ${packages[*]}
do
	printf "%s %s\n" "-" $package
	sudo apt -y install $package > /dev/null
done
