<h1 align="center">
    Chilipizdrick's NixOS dotfiles
</h1>

> [!WARNING]
> These dotfiles are created for personal use and assume my workflow. Use at your own risk.

## Prerequisites

- Installation of NixOS

## Installation

> [!IMPORTANT]
> Replace `<host>` below with preferred host configuration (one of `atlas`, `aurora`).

```sh
# This section is executed from live usb
export NIX_CONFIG="experimental-features = nix-command flakes"
nix run nixpkgs#git -- clone --depth=1 https://github.com/chilipizdrick/dotfiles.git
cd dotfiles
sudo nix run github:nix-community/disko -- --mode disko ./hosts/<host>/_disko.nix
sudo nixos-generate-config --no-filesystems --root /mnt --show-hardware-config > ./hosts/<host>/_hardware_configuration.nix
sudo nixos-install --flake .#<host>
```

## Thanks to

- [zDyant](https://github.com/zDyanTB) and [Ja.KooLit](https://github.com/JaKooLit) for creating insanely cool dotfiles
- [Gabriel Fontes](https://github.com/Misterio77) for creating comprehensive and comprehensible starting templates for NixOS and home-manager configurations

