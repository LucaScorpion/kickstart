#!/bin/bash

# Copy the files from the templates to the user templates folder.
printf "Copying templates.\n"
cp -rf ../resources/templates/. /home/$(logname)/Templates
