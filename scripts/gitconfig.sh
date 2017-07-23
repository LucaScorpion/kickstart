#!/bin/bash

# Set the git configuration options.
printf "Setting git configuration options.\n"
git config --global remote.origin.prune true

# Set user config.
printf "Checking git user configuration.\n"

name=$(git config --global user.name)
email=$(git config --global user.email)

if [ -z "$name" ]
then
	# Get the full name from the user profile.
	printf "Getting full name from user profile.\n"
	gecosField=$(getent passwd $USER | cut -d ':' -f 5)
	fullName=$(echo "$gecosField" | cut -d ',' -f 1)
	git config --global user.name "$fullName"
fi

if [ -z "$email" ]
then
	printf "Enter your e-mail address: "
	read -e email
	git config --global user.email "$email"
fi
