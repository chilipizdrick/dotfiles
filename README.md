# dotfiles

Personal nixos and home-manager configuration.

## Prerequisites

- Installation of nixos

## Installation

```sh
export NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#git
git clone --depth=1 https://github.com/chilipizdrick/dotfiles.git
cd dotfiles
cp -f /etc/nixos/hardware-configuration.nix ./nixos/{host}/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#{host}
home-manager switch --flake .
```
