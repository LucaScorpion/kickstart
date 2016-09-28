#!/bin/bash

# The link to download the JDK from.
oraclesite="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"

# Download the Oracle JDK.
printf "Downloading Oracle JDK.\n"
raw=$(curl -s $oraclesite | grep -Po "\['jdk-\d+u\d+-linux-x64.tar.gz'\] = \{.*?\}" | head -1)
jdklink=$(echo $raw | grep -Po "http://.*tar\.gz")
jdktar=$(echo $jdklink | sed "s/^.*\///")
curl -L -# --cookie "oraclelicense=accept-securebackup-cookie" $jdklink > "/tmp/${jdktar}"
#TODO: Verify SHA256 sum.

# Package the JDK,
printf "Packaging JDK. Please be patient, this might take a few minutes.\n"
yes | sudo -u $SUDO_USER make-jpkg "/tmp/${jdktar}" &> /dev/null

# Install the JDK.
printf "Installing JDK.\n"
jdkversion=$(echo $jdktar | grep -Po "\d+u\d+")
jdkmajor=$(echo $jdkversion | grep -Po "\d+" | head -1)
jdkdeb="oracle-java${jdkmajor}-jdk_${jdkversion}_amd64.deb"
dpkg -iG $jdkdeb > /dev/null

# Clean up.
printf "Cleaning up.\n"
rm "/tmp/${jdktar}"
rm $jdkdeb
