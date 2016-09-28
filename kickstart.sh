#!/bin/bash

# The packages to install.
packages=(sudo git curl zsh screenfetch filezilla gimp bless qbittorrent fakeroot java-package expect fonts-powerline)

# Check if we are running as root.
if [ "$EUID" -ne 0 ]; then
  echo "This script needs to be executed as root to work properly."
  exit 1
fi

# Set the sources.list file to contain all the standard repos (also contrib and non-free).
echo "Updating sources.list (a backup will be created)."
listfile="/etc/apt/sources.list"
mv $listfile "$listfile.bak"
echo "deb http://httpredir.debian.org/debian jessie non-free contrib main" > $listfile
echo "deb-src http://httpredir.debian.org/debian jessie non-free contrib main" >> $listfile
echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> $listfile
echo "deb-src http://security.debian.org/ jessie/updates non-free contrib main" >> $listfile
echo "deb http://httpredir.debian.org/debian jessie-updates non-free contrib main" >> $listfile
echo "deb-src http://httpredir.debian.org/debian jessie-updates non-free contrib main" >> $listfile

# Update the package list, install the basic packages.
echo "Updating package list."
apt-get -qq update
echo "Installing packages:"
for package in ${packages[*]}
do
	echo "- $package"
	apt-get -qq -y install $package 
done
echo "Done installing packages."

# Set the default shell to zsh.
echo "Setting default shell to zsh."
chsh -s /bin/zsh

# Install Oh My Zsh for the current user.
echo "Installing Oh My Zsh."
sudo -u $SUDO_USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

# That's all folks!
echo "Done!"
exit 0
