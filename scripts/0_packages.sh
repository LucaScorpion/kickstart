#!/bin/bash

# Skip in fast mode.
if [ "$KICKSTART_FAST" = true ]
then
	printf "Skipping packages.\n"
	exit
fi

# The packages to install.
packages=(
	git
	curl
	screenfetch
	filezilla
	gimp
	bless
	qbittorrent
	java-package
	fonts-powerline
	apt-transport-https
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
)

# Update the package list and upgrade packages.
printf "Updating package list.\n"
sudo apt-get update > /dev/null
printf "Upgrading packages.\n"
sudo apt-get -y upgrade > /dev/null

# Install the packages.
printf "Installing packages:\n"
for package in ${packages[*]}
do
	printf "%s $package\n" "-"
	sudo apt-get -y install $package > /dev/null
done
