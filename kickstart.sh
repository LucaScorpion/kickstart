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
	printf "${red}These scripts require the sudo package to be installed.${normal}\n"
	exit 1
fi

# Check if we are running as root.
if (( "$EUID" == 0 ))
then
	printf "${red}This script should not be executed as root. Where necessary, sudo will be used.${normal}\n"
	exit 2
fi

# Print the usage text.
printHelp()
{
	printf "\
Antergos Kickstart
https://github.com/LucaScorpion/antergos-kickstart

Usage: ./kickstart.sh
Options:
-h, --help    View this help text
"
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
			printf "${red}Invalid option: $1${normal}\n"
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
	printf "${blue}= $(basename "$file")$normal\n"
	"$file"
	printf "\n"
done

# That's all folks!
printf "${green}Done!${normal}\n"
