#!/bin/bash

# Install zsh.
printf "Installing zsh.\n"
sudo apt -y install zsh > /dev/null

# Set the default shell to zsh.
printf "Setting default shell to zsh.\n"
chsh -s /bin/zsh $(logname)

# Install Oh My Zsh for the current user.
printf "Installing Oh My Zsh.\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Download the Bullet Train theme.
printf "Downloading Bullet Train theme.\n"
curl -# "https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme" > ~/.oh-my-zsh/themes/bullet-train.zsh-theme

# Copy zsh configuration file.
printf "Copying zsh configuration (a backup will be created).\n"
mv ~/.zshrc ~/.zshrc.bak
cp zshrc ~/.zshrc
