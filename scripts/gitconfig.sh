#!/bin/bash

# Set the git configuration options.
printf "Setting git configuration options.\n"
git config --global remote.origin.prune true
git config --global credential.helper cache

# Set user config.
printf "Checking git user configuration.\n"

name=$(git config --global user.name)
email=$(git config --global user.email)

if [ -z "$name" ]
then
	printf "Enter your name: "
	read -e name
	git config --global user.name "$name"
fi

if [ -z "$email" ]
then
	printf "Enter your e-mail address: "
	read -e email
	git config --global user.email "$email"
fi
