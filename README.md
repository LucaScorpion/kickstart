# Antergos Kickstart
A collection of scripts that will kickstart a fresh [Antergos](https://antergos.com/) installation.

## Running the scripts
To execute all scripts, simply run `kickstart.sh`.
This will execute all executable files in the `scripts` directory.
The scripts are made not just to kickstart a fresh installation, but also to update an existing one.

## Scripts
| Script | Description |
| ------ | ----------- |
| 0-packages.sh | Install a set of useful packages. |
| dotfiles.sh | Update dotfiles in the user home directory. |
| gsettings.sh | Set gsettings values. |
| shell.sh | Install Oh My Zsh and the Spaceship theme. |
| templates.sh | Add a number of useful templates to the `~/Templates` directory. |
| vscode.sh | Set the Visual Studio Code user configuration. |
