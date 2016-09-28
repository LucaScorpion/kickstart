#!/bin/bash

# Install zsh.
printf "Installing zsh.\n"
apt-get -qq -y install zsh

# Set the default shell to zsh.
printf "Setting default shell to zsh.\n"
chsh -s /bin/zsh

# Install Oh My Zsh for the current user.
printf "Installing Oh My Zsh.\n"
sudo -u $SUDO_USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
