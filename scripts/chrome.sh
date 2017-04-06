#!/bin/bash

# Check if Chrome is already installed.
if [ $(which google-chrome) ]
then
	printf "Google Chrome is already installed, skipping.\n"
	exit
fi

# Create the source entry.
printf "Creating source entry:\n"
entry="deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
printf "$entry\n" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Update and install Chrome.
printf "Updating package list.\n"
sudo apt-get update > /dev/null
printf "Installing Google Chrome.\n"
sudo apt-get -y install google-chrome-stable > /dev/null
