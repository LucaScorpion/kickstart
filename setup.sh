#!/bin/bash

extracted="/tmp/Debian-kickstart-master"
archive="$extracted.zip"

# Download the latest master archive from GitHub.
printf "Downloading archive.\n"
wget -qO "$archive" "https://github.com/LucaScorpion/Debian-kickstart/archive/master.zip"

# Extract the archive.
printf "Extracting archive.\n"
unzip -q -d "/tmp" "$archive"

# Run the kickstart.
printf "Running kickstart.\n"
"$extracted/kickstart.sh"

# Remove the archive and extracted files.
printf "Cleaning up.\n"
rm "$archive"
rm -rf "$extracted"
