#!/bin/bash

# Install zsh.
printf "Installing zsh.\n"
apt-get -qq -y install zsh

# Set the default shell to zsh.
printf "Setting default shell to zsh.\n"
chsh -s /bin/zsh $(logname)

# Install Oh My Zsh for the current user.
printf "Installing Oh My Zsh.\n"
sudo -u $(logname) sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Download the Bullet Train theme.
printf "Downloading Bullet Train theme.\n"
curl -# "https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme" > /home/$(logname)/.oh-my-zsh/themes/bullet-train.zsh-theme
