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
| `2_shell.sh` | Install Oh My Zsh and set up the theme.
| `3_dotfiles.sh` | Update dotfiles in the user home directory.
| `4_bin` | Copy scripts to `~/bin`.
| `5_vscode.sh` | Set the Visual Studio Code user configuration.
| `6_dconf.sh` | Import dconf settings. These dumps can be created using [dconf-dump.sh](./dconf-dump.sh).

## Other Info

The info here may differ depending on the specific distro or window manager.

### SSH agent

The Gnome keyring SSH functionality is disabled by default.
To enable it, run:

```shell
systemctl --user enable gcr-ssh-agent.socket
systemctl --user start gcr-ssh-agent.socket
```

See: https://wiki.archlinux.org/title/GNOME/Keyring#SSH_keys

### Bluetooth

You may have to enable the bluetooth service:

```shell
sudo systemctl enable bluetooth
```

### Gnome extensions

Some recommended Gnome extensions:

- [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support)
- [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock)
- [Steal my focus window](https://extensions.gnome.org/extension/6385/steal-my-focus-window)
- [Removable Drive Menu](https://extensions.gnome.org/extension/7/removable-drive-menu)
- [Emoji Copy](https://extensions.gnome.org/extension/6242/emoji-copy)

### USB Sound Cards

For USB sound cards like a Focusrite Scarlett, there are a couple of improvements to set up.

To prevent it from suspending after a while, edit `/etc/pulse/default.pa` and comment out this line:

```
load-module module-suspend-on-idle
```

In the audio playback settings, make sure the output mode is set to "Direct".

### Faillock

Faillock configuration can be found in: `/etc/security/faillock.conf`.

### Fingerprint

To enable fingerprint scanning, install the `fprintd` package.
To use it for `sudo`, add the following line to `/etc/pam.d/sudo`:

```
auth            sufficient      pam_fprintd.so
```

The complete file should look like this:

```
#%PAM-1.0
auth            sufficient      pam_fprintd.so

auth            include         system-auth
account         include         system-auth
session         include         system-auth
```
