#!/bin/bash

# Copy the gtk settings file.
printf "Copying gtk settings file.\n"
cp "$RESOURCES/gtk-settings.ini" "$HOME/.config/gtk-4.0/settings.ini"
