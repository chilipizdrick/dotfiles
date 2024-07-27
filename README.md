# dotfiles

Personal nixos and home-manager configuration.

## Prerequisites

- Installation of nixos

## Installation

```sh
export NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#git
git clone --depth=1 https://github.com/chilipizdrick/dotfiles.git
sudo nixos-rebuild switch --flake .#{host}
home-manager switch --flake .
```
