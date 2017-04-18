#!/bin/bash

printf "Setting gsettings entries:\n"

# General.
printf "%s General\n" "-"
gsettings set org.gnome.shell.overrides focus-change-on-pointer-rest false

# Terminal.
printf "%s Terminal\n" "-"
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode tab
gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false

# Gedit.
printf "%s Gedit\n" "-"
gsettings set org.gnome.gedit.preferences.editor auto-indent true
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor insert-spaces false
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.ui side-panel-visible true
