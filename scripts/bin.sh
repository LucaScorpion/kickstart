#!/bin/bash

# Copy all files from the resources/bin directory to ~/bin.
printf "Copying bin files.\n"
cp -rf "$RESOURCES/bin/." "$HOME/bin"