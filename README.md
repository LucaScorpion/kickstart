# Kickstart

A collection of scripts that will kickstart a fresh Linux installation.

## Before Starting

On Arch-based distro's, you will need to install a couple of packages:

```shell
sudo pacman -S base-devel xclip noto-fonts-emoji
```

## Running the Scripts

To execute all scripts, simply run `kickstart.sh`.
This will execute all executable files in the `scripts` directory.
The scripts are made not just to kickstart a fresh installation, but also to update an existing one.

## Scripts

| Script | Description |
| ------ | ----------- |
| `1_shell.sh` | Install Oh My Zsh and the Spaceship theme.
| `2_dotfiles.sh` | Update dotfiles in the user home directory.
| `3_vscode.sh` | Set the Visual Studio Code user configuration.

## Other Info

### USB Sound Cards

For USB sound cards like a Focusrite Scarlett, there are a couple of improvements to set up.

To prevent it from suspending after a while, edit `/etc/pulse/default.pa` and comment out this line:

```
load-module module-suspend-on-idle
```

In the audio playback settings, make sure the output mode is set to "Direct".
