# dotfiles

Personal NixOS and home-manager dotfiles.

## Prerequisites

- Installation of NixOS

## Installation

Replace `<host>` below with preferred host configuration (one of `atlas`, `aurora`).

```sh
export NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#git
git clone --depth=1 https://github.com/chilipizdrick/dotfiles.git
cd dotfiles
cp -f /etc/nixos/hardware-configuration.nix ./nixos/hosts/<host>/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#<host>
home-manager switch --flake .
```
