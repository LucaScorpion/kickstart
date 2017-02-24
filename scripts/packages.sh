#!/bin/bash

# The packages to install.
packages=(sudo git curl screenfetch filezilla gimp bless qbittorrent java-package fonts-powerline apt-transport-https)

# Set the sources.list file to contain all the standard repos.
printf "Updating sources.list (a backup will be created).\n"
sourcesFile="/etc/apt/sources.list"
mv $sourcesFile "$sourcesFile.bak"
cp ../resources/sources.list $sourcesFile

# Update the package list and upgrade packages.
printf "Updating package list and upgrading packages.\n"
apt-get -qq update
apt-get -qq -y upgrade

# Install the packages.
printf "Installing packages:\n"
for package in ${packages[*]}
do
	printf "%s %s\n" "-" $package
	apt-get -qq -y install $package
done
