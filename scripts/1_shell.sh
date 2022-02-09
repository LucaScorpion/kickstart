#!/usr/bin/env bash
set -euo pipefail

# Check if Zsh is installed.
if [ ! $(command -v zsh) ]
then
	printf "Z shell is not installed, skipping.\n"
	exit
fi

# Check if oh-my-zsh is already installed.
if [ -d "$HOME/.oh-my-zsh" ]
then
	printf "Oh My Zsh is already installed, skipping.\n"
else
	# Install Oh My Zsh.
	printf "Installing Oh My Zsh.\n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	printf "Changing shell to zsh.\n"
	chsh -s $(which zsh)
fi

# Check if the custom themes dir exists.
themesDir="$HOME/.oh-my-zsh/custom/themes"
if [ ! -d "$themesDir" ]
then
	mkdir -p "$themesDir"
fi

# Download or update the Spaceship theme.
spaceshipDir="$themesDir/spaceship-prompt"
if [ ! -d "$spaceshipDir" ]
then
	printf "Downloading Spaceship theme.\n"
	git clone https://github.com/denysdovhan/spaceship-prompt.git "$spaceshipDir"
	ln -s "$spaceshipDir/spaceship.zsh-theme" "$themesDir/spaceship.zsh-theme"
else
	printf "Updating Spaceship theme.\n"
	git -C "$spaceshipDir" pull
fi
