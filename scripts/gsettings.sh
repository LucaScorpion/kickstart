#!/bin/bash

printf "Setting gsettings entries:\n"

# Desktop.
printf "%s Desktop\n" "-"
gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat
gsettings set org.gnome.desktop.wm.preferences auto-raise true
gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface gtk-theme Numix

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

# Nautilus.
printf "%s Nautilus\n" "-"
gsettings set org.gnome.nautilus.preferences automatic-decompression false
gsettings set org.gnome.nautilus.preferences default-folder-viewer list-view
gsettings set org.gnome.nautilus.preferences search-view list-view
