# Kickstart

A collection of scripts that will kickstart a fresh Linux installation.

## Running the Scripts

To execute all scripts, simply run `kickstart.sh`.
This will execute all executable files in the `scripts` directory.
The scripts are made not just to kickstart a fresh installation, but also to update an existing one.

## Scripts

| Script | Description |
| ------ | ----------- |
| `1_packages.sh` | Install some basic required packages.
| `2_shell.sh` | Install Oh My Zsh and set up the theme and profile.
| `3_dotfiles.sh` | Update dotfiles in the user home directory.
| `4_bin` | Copy scripts to `~/bin`.
| `5_vscode.sh` | Set the Visual Studio Code user configuration.

## Other Info

### USB Sound Cards

For USB sound cards like a Focusrite Scarlett, there are a couple of improvements to set up.

To prevent it from suspending after a while, edit `/etc/pulse/default.pa` and comment out this line:

```
load-module module-suspend-on-idle
```

In the audio playback settings, make sure the output mode is set to "Direct".

### Faillock

Faillock configuration can be found in: `/etc/security/faillock.conf`.
