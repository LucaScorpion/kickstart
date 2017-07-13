#!/bin/bash

# Check if the JDK is already installed.
if [[ $(dpkg -s oracle-java8-installer) ]]
then
	printf "Oracle JDK is already installed, skipping.\n"
	exit
fi

# Add the public key and repository.
printf "Adding webupd8team/java PPA repository.\n"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
printf "\n" | sudo add-apt-repository ppa:webupd8team/java

# Update, install the JDK.
printf "\nUpdating package list.\n"
sudo apt-get -q update

printf "\nInstalling Oracle JDK.\n"
sudo apt-get -qy install oracle-java8-installer
