#!/bin/bash

# Copy the jdk8.list file.
printf "Copying jdk 8 ppa source file.\n"
cp jdk8-ppa.list /etc/apt/sources.list.d/jdk8-ppa.list

# Update the package list, install the oracle jdk package.
printf "Updating package list.\n"
apt-get -qq update
printf "Installing oracle jdk 8 package.\n"
apt-get -qq --force-yes install oracle-java8-installer
