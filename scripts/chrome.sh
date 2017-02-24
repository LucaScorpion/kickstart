#!/bin/bash

# Create the source entry.
printf "Creating source entry.\n"
entry="deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
echo $entry > /etc/apt/sources.list.d/google-chrome.list

# Update and install chrome.
printf "Updating package list.\n"
apt-get -qq update
printf "Installing Google Chrome.\n"
apt-get -qq -y install google-chrome-stable
