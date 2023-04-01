# bspwm-setup
Deployment script for my bspwm setup that gets me up an running from after a fresh install.

## Usage
Verify that `install.sh` doesn't do anything shady, then run it.

```bash
./install.sh
```

Currently supports Fedora and Arch-based distros.

## Post Installation
I recommend rebooting after the initial install.

### Neovim Configuration
LSP configurations and plugins are set by the following steps.

1. Open neovim and execute `:PackerSync`.
2. Exit and relaunch neovim.
3. Wait until all LSP configurations have been compiled.
