# Luke's Nix Configuration

My NixOS configuration files.

All configurations are configured by Nix, allowing for more reproducibility across machines.

## Aspects not included
- [Firefox Theme](https://github.com/catppuccin/firefox)
- Audio configuration (edited by pavucontrol-qt)
- Spicetify Spotify path

# Install
1. Enable flakes
```shell
nix-shell -p nixFlakes
```

2. Install NixOS from flake
```shell
nixos-install --flake 'github:lukerhoads/dotfiles#'
```

3. Install `home-manager` configuration
```shell
home-manager switch --flake 'github:lukerhoads/dotfiles#luke@home'
```