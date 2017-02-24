#!/bin/bash

# Create the source entry.
printf "Creating source entry:\n"
entry="deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
echo $entry | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Update and install chrome.
printf "Updating package list.\n"
sudo apt -qq update
printf "Installing Google Chrome.\n"
sudo apt -y install google-chrome-stable > /dev/null
