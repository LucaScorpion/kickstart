#!/bin/bash

# Install the Vertex theme.
printf "Creating source entry.\n"
entry="deb http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/ /"
echo $entry > /etc/apt/sources.list.d/vertex-theme.list 

# Update and install the Vertex theme.
printf "Updating package list.\n"
apt-get -qq update
printf "Installing Vertex theme.\n"
apt-get -qq -y install vertex-theme
