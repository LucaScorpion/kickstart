#!/bin/bash

# Copy all files from the resources/bin directory to ~/bin.
printf "Copying bin files.\n"
if [ ! -d "$HOME/bin" ]
then
	mkdir "$HOME/bin"
fi
