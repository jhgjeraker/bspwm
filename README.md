# bspwm-setup
Single point deployment script for my bspwm setup that gets me up an running from after a fresh install.

The result is shown below.

<img src="https://f002.backblazeb2.com/file/bb-gjeraker/projects/bspwm/bspwm-setup-target.jpeg">

Note that everything here is, of course, biased towards my own preferences.

## Usage
Verify that `install.sh` doesn't do anything shady, then run it.

```bash
./install.sh
```

Currently supports Arch-based distros, but can be expanded by adding the appropriate package list.

## Post Installation
I recommend rebooting after the initial install.

### Neovim Configuration
LSP configurations and plugins are set by the following steps.

1. Open neovim and execute `:PackerSync`.
2. Exit and relaunch neovim.
3. Wait until all LSP configurations have been compiled.
