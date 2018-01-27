#!/bin/bash

# Disable LightDM, enable GDM.
printf "Switching to GDM.\n"
sudo systemctl disable lightdm && sudo systemctl enable gdm
