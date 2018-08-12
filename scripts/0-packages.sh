#!/bin/bash

# Install the packages.
printf "Installing packages:\n"
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
