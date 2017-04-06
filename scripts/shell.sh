#!/bin/bash

# Check if zsh is already installed.
if [ $(which zsh) ]
then
	printf "ZSH is already installed, skipping.\n"
else
	# Install zsh.
	printf "Installing zsh.\n"
	sudo apt-get -y install zsh > /dev/null

	# Set the default shell to zsh.
	printf "Setting default shell to zsh.\n"
	chsh -s /bin/zsh $USER
fi

# Check if oh-my-zsh is already installed.
if [ -d "$HOME/.oh-my-zsh" ]
then
	printf "Oh-my-zsh is already installed, skipping.\n"
else
	# Install Oh My Zsh for the current user.
	printf "Installing Oh My Zsh.\n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Download the Bullet Train theme.
printf "Downloading Bullet Train theme.\n"
mkdir -p $HOME/.oh-my-zsh/custom/themes
curl -# "https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme" > $HOME/.oh-my-zsh/custom/themes/bullet-train.zsh-theme

# Copy zsh configuration file.
printf "Copying Zsh configuration.\n"
cp -b $RESOURCES/zshrc $HOME/.zshrc
