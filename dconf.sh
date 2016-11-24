#!/bin/bash

# Set dconf entries.
printf "Setting dconf entries.\n"
dconf write /org/gnome/nautilus/preferences/always-use-location-entry true

