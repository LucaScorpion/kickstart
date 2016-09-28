#!/bin/bash

# The packages to install.
packages=(sudo git curl zsh screenfetch filezilla gimp bless qbittorrent fakeroot java-package expect fonts-powerline)

# Set the sources.list file to contain all the standard repos.
echo "Updating sources.list (a backup will be created)."
listfile="/etc/apt/sources.list"
mv $listfile "$listfile.bak"
cp ./sources $listfile

# Update the package list, install the basic packages.
echo "Updating package list."
apt-get -qq update
echo "Installing packages:"
for package in ${packages[*]}
do
	echo "- $package"
	apt-get -qq -y install $package 
done
echo "Done installing packages."

# Set the default shell to zsh.
echo "Setting default shell to zsh."
chsh -s /bin/zsh

# Install Oh My Zsh for the current user.
echo "Installing Oh My Zsh."
sudo -u $SUDO_USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
