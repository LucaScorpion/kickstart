#!/bin/bash

# Create the gtk settings file.
if [ ! -f "$HOME/.config/gtk-4.0/settings.ini" ]
then
	printf "Creating gtk settings file.\n"
	printf "[Settings]\ngtk-application-prefer-dark-theme=1\n" > "$HOME/.config/gtk-4.0/settings.ini"
fi
