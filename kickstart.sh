#!/bin/bash

# Check if we are running as root.
if [ "$EUID" -ne 0 ]
then
	echo "This script needs to be executed as root to work properly."
	exit 1
fi

# Execute the helper scripts.
./packages.sh
./jdk.sh

# That's all folks!
echo "Done!"
exit 0
