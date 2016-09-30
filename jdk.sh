#!/bin/bash

# The link to download the JDK from.
oracleSite="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"

# Download the Oracle JDK.
printf "Downloading Oracle JDK.\n"
raw=$(curl -s $oracleSite | grep -Po "\['jdk-\d+u\d+-linux-x64.tar.gz'\] = \{.*?\}" | head -1)
downloadLink=$(echo $raw | grep -Po "http://.*tar\.gz")
jdkTar=$(echo $downloadLink | sed "s/^.*\///")
curl -L -# --cookie "oraclelicense=accept-securebackup-cookie" $downloadLink > "/tmp/${jdkTar}"
#TODO: Verify SHA256 sum.

# Package the JDK,
printf "Packaging JDK. Please be patient, this might take a few minutes.\n"
yes | sudo -u $(logname) make-jpkg "/tmp/${jdkTar}" &> /dev/null

# Install the JDK.
printf "Installing JDK.\n"
jdkVersion=$(echo $jdkTar | grep -Po "\d+u\d+")
jdkMajor=$(echo $jdkVersion | grep -Po "\d+" | head -1)
jdkDeb="oracle-java${jdkMajor}-jdk_${jdkVersion}_amd64.deb"
dpkg -iG $jdkDeb > /dev/null

# Clean up.
printf "Cleaning up.\n"
rm "/tmp/${jdkTar}"
rm $jdkDeb