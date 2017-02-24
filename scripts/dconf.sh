#!/bin/bash

# A function to set an entry.
function entry
{
	sudo -u $(logname) dconf write $1 $2
}

# Set dconf entries.
printf "Setting dconf entries.\n"
entry /org/gnome/nautilus/preferences/sort-directories-first true
