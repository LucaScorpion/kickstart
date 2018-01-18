#!/bin/bash

# Create the yaourtrc.
if [ ! -f "$HOME/.yaourtrc" ]
then
	printf "Creating yaourtrc file.\n"
	printf "NOCONFIRM=1\n" > "$HOME/.yaourtrc"
fi

# Update the system.
printf "Upgrading system.\n"
yaourt -Syu

# Install the packages.
printf "\nInstalling packages.\n"
while read -r package
do
	# Check if the line is a comment or empty.
	case "$package" in
		"" | \#*)
			continue
	esac

	# Check if the package is already installed.
	if [[ ! $(yaourt -Q $package) ]]
	then
		printf "%s $package\n" "-"
		yaourt -S $package
	fi
done < "$RESOURCES/packages"
