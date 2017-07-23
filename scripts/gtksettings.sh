#!/bin/bash

# Copy the gtk settings file.
printf "Copying gtk settings file.\n"
cp "$RESOURCES/gtk-settings.ini" "$HOME/.config/gtk-3.0/settings.ini"
