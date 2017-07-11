#!/bin/bash

# Skip in fast mode.
if [ "$KICKSTART_FAST" = true ]
then
	printf "Skipping Telegram.\n"
	exit
fi

# Check if Telegram is already installed.
if [ -d "/opt/Telegram" ]
then
	printf "Telegram is already installed, skipping.\n"
	exit
fi

# The link to download Telegram from.
telegramSite="https://telegram.org/dl/desktop/linux"

# Download the archive.
printf "Downloading Telegram desktop.\n"
tmpTar="/tmp/telegram.tar.xz"
curl -L# $telegramSite > "$tmpTar"

# Extract the archive.
printf "Installing Telegram.\n"
sudo tar xf "$tmpTar" -C "/opt"

# Clean up.
printf "Cleaning up.\n"
rm "$tmpTar"
