#!/bin/bash

# Check if zsh is already installed.
if [ $(command -v zsh) ]
then
	printf "Zsh is already installed, skipping.\n"
else
	# Install zsh.
	printf "Installing zsh.\n"
	#sudo apt-get -y install zsh > /dev/null
fi

# Check if oh-my-zsh is already installed.
if [ -d "$HOME/.oh-my-zsh" ]
then
	printf "Oh My Zsh is already installed, skipping.\n"
else
	# Install Oh My Zsh for the current user.
	printf "Installing Oh My Zsh.\n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Download the Bullet Train theme.
printf "Downloading Bullet Train theme.\n"
themesDir="$HOME/.oh-my-zsh/custom/themes"
mkdir -p "$themesDir"
curl -# "https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme" > "$themesDir/bullet-train.zsh-theme"

# Copy zsh configuration file.
printf "Copying Zsh configuration.\n"
cp -b "$RESOURCES/zshrc" "$HOME/.zshrc"
