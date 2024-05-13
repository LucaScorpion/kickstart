#!/usr/bin/env bash
set -euo pipefail

# Check if Zsh is installed.
if [ ! $(command -v zsh) ]
then
	echo 'Zsh is not installed, skipping.'
	exit
fi

# Check if oh-my-zsh is already installed.
if [ -d "$HOME/.oh-my-zsh" ]
then
	echo 'Oh My Zsh is already installed.'
else
	# Install Oh My Zsh.
	echo 'Installing Oh My Zsh.'
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	echo 'Changing shell to zsh.'
	chsh -s $(which zsh)
fi

# Check if the custom themes dir exists.
themesDir="$HOME/.oh-my-zsh/custom/themes"
if [ ! -d "$themesDir" ]
then
	mkdir -p "$themesDir"
fi

# Download or update the Gokart theme.
echo 'Downloading Gokart theme.'
curl -fsSL https://github.com/LucaScorpion/gokart-prompt/releases/latest/download/gokart-prompt-linux-amd64.tar.gz  | tar xzf - -C "$themesDir"

if [ ! -f "$themesDir/gokart.zsh-theme" ]
then
	ln -s "$themesDir/gokart-prompt/gokart.zsh-theme" "$themesDir/gokart.zsh-theme"
fi
