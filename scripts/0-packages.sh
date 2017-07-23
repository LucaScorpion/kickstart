#!/bin/bash

# The packages to install.
packages=(
	git
	curl
	screenfetch
	filezilla
	gimp
	bless
	qbittorrent
	fonts-powerline
	maven
	java-common
	numlockx
	vlc
	libcanberra-gtk-module
	htop
	libgconf-2-4
	dconf-editor
	php7.0
	numix-gtk-theme
	dirmngr
)

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
