#!/bin/bash

# The packages to install.
packages=(sudo git curl zsh screenfetch filezilla gimp bless qbittorrent java-package fonts-powerline)

# Set the sources.list file to contain all the standard repos.
printf "Updating sources.list (a backup will be created).\n"
sourcesFile="/etc/apt/sources.list"
mv $sourcesFile "$sourcesFile.bak"
cp -f ./sources $sourcesFile

# Update the package list, install the basic packages.
printf "Updating package list.\n"
apt-get -qq update
printf "Installing packages:\n"
for package in ${packages[*]}
do
	printf "%s %s\n" "-" $package
	apt-get -qq -y install $package 
done
printf "Done installing packages.\n"

# Set the default shell to zsh.
printf "Setting default shell to zsh.\n"
chsh -s /bin/zsh

# Install Oh My Zsh for the current user.
printf "Installing Oh My Zsh.\n"
sudo -u $SUDO_USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
