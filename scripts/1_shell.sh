#!/usr/bin/env bash
set -euo pipefail

# Check if Zsh is installed.
if [ ! $(command -v zsh) ]
then
	printf "Zsh is not installed, skipping.\n"
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

# Download or update the Gokart theme.
printf "Downloading Gokart theme.\n"
curl -fsSL https://github.com/LucaScorpion/gokart-prompt/releases/latest/download/gokart-prompt.tar.gz | tar xzf - -C "$themesDir"
