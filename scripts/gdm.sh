#!/bin/bash

# Disable lightdm, enable gdm.
printf "Enabling GDM.\n"
sudo systemctl disable lightdm && sudo systemctl enable gdm
