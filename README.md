# Dotfiles

My dotfiles repo for my NixOS machines.

## Usage

```
# rebuild
sudo nixos-rebuild switch --flake ~/dotfiles#amboss-oktagon
sudo nixos-rebuild switch --flake ~/dotfiles#pc

# home manager
home-manager switch --flake ~/dotfiles#timl

# code format
nix fmt

```
