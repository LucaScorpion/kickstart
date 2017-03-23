#!/bin/bash

# Set the git configuration options.
printf "Setting git configuration options.\n"
git config --global remote.origin.prune true
git config --global credential.helper cache
