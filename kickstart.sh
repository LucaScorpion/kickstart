#!/usr/bin/env bash
set -euo pipefail

# Get some colors.
normal=$(tput sgr0)
blue=$(tput setaf 14)
red=$(tput setaf 1)
green=$(tput setaf 2)

# Check if sudo is installed.
if [ ! $(command -v sudo) ]
then
	echo "${red}These scripts require the sudo package to be installed.${normal}"
	exit 1
fi

# Check if we are running as root.
if (( "$EUID" == 0 ))
then
	echo "${red}This script should not be executed as root. Where necessary, sudo will be used.${normal}"
	exit 2
fi

# Print the usage text.
printHelp()
{
	echo '
Kickstart
https://github.com/LucaScorpion/kickstart

Usage: ./kickstart.sh
Options:
-h, --help    View this help text
'
}

# Parse options.
while (( $# > 0 ))
do
	case "$1" in
		# Print help text.
		-h|--help)
			printHelp
			exit
			;;
		# Invalid options.
		*)
			echo "${red}Invalid option: $1${normal}"
			printHelp
			exit 3
	esac
	shift
done

# Get the base and resources directories.
baseDir=$(realpath $(dirname $0))
export RESOURCES="$baseDir/resources"

# Execute all scripts.
for file in "$baseDir/scripts/"*
do
	[ -x "$file" ] || continue
	echo "${blue}= $(basename "$file")$normal"
	"$file"
	echo
done

# That's all folks!
echo "${green}Done!${normal}"
