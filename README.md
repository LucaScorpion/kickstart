# Debian-kickstart
A collection of scripts that will kickstart a fresh Debian installation.

### Scripts
- kickstart.sh: run all the other scripts.
- packages.sh: set the sources list to contain all the basic sources (including non-free and contrib) and download a set of useful packages.
- shell.sh: download and install zsh and Oh My Zsh, set the zsh configuration.
- templates.sh: add a number of useful templates to the ~/Templates folder.
- jdk.sh: download the latest Oracle JDK, package and install it using java-package.

### Adjustments
Most of the scripts are based on personal preference (e.g. the packages to install, the templates).
However, I did try to make it so that most of this can be easily changed.
Here are the items that can be changed easily:

- The packages to install, look at the top of packages.sh.
- The templates, change the content of Templates/.
- The sources file, change the sources file.
- The zsh configuration, change the zshrc file.
