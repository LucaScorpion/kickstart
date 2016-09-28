#!/bin/bash

# Download the Oracle JDK.
echo "Downloading Oracle JDK."
jdkversion="8u101"
jdkdlnumber="13"
curl -L -# --cookie "oraclelicense=accept-securebackup-cookie" "https://edelivery.oracle.com/otn-pub/java/jdk/${jdkversion}-b${jdkdlnumber}/jdk-${jdkversion}-linux-x64.tar.gz" > "/tmp/jdk-${jdkversion}-linux-x64.tar.gz"
#TODO: automatically download the latest version.

# Package the JDK,
echo "Packaging JDK."
sudo -u $SUDO_USER fakeroot make-jpkg "/tmp/jdk-${jdkversion}-linux-x64.tar.gz"
# TODO: use expect to auto answer, redirect stdout to /dev/null.

# Install the JDK.
echo "Installing JDK."
dpkg -i "oracle-java8-jdk_${jdkversion}_amd64.deb"
