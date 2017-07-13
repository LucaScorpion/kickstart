# Debian-kickstart
A collection of scripts that will kickstart a fresh Debian installation.

### One-line setup
This command will run the `setup.sh` script, which will download and run the project.

```
wget -qO- https://raw.githubusercontent.com/LucaScorpion/Debian-kickstart/master/setup.sh | bash
```

### Running the project
To execute all scripts, run kickstart.sh.
This will execute all executable files in the `scripts` directory.
The scripts are made not just to kickstart a fresh installation, but also to update an existing one.

### Scripts
| Script | Explanation |
| ------ | ----------- |
| 0_packages.sh | Install a set of useful packages. |
| bin.sh | Copy a set of scripts to the ~/bin directory. |
| cleanup.sh | Remove unwanted packages. |
| gitconfig.sh | Check and set git configuration options. |
| gsettings.sh | Set gsettings values. |
| jdk.sh | Add a PPA for the Oracle JDK, install it. |
| shell.sh | Install Zsh and Oh My Zsh, set the Zsh configuration. |
| templates.sh | Add a number of useful templates to the ~/Templates directory. |
| vscode.sh | Install Visual Studio Code, set the user configuration. |
