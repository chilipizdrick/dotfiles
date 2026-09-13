<h1 align="center">
    Chilipizdrick's NixOS dotfiles
</h1>

> [!WARNING]
> These dotfiles are created for personal use and assume my workflow. Use at your own risk.

## Prerequisites

- Live USB with nixos image

## Installation

> [!IMPORTANT]
> Replace `<host>` below with preferred host configuration (one of `atlas`, `aurora`).

```sh
# This section is executed from live usb
nix run nixpkgs#git -- clone --depth=1 https://github.com/chilipizdrick/dotfiles.git
cd dotfiles
sudo nix run --option experimental-features 'nix-command flakes' github:nix-community/disko -- --mode disko ./hosts/<host>/_disko.nix
sudo nixos-generate-config --no-filesystems --root /mnt --show-hardware-config > ./hosts/<host>/_hardware-configuration.nix
sudo nixos-install --flake .#<host>
```

## Post install setup

During dedicated netns tailscale vpn setup don't forget to set `--accept-dns=false`,
or else all of the system trafic will be routed through inaccessible DNS:

```sh
sudo tailscale-vpn up --accept-dns=false --login-server=<login-server> --exit-node=<exit-node>
```

## Thanks to

- [zDyant](https://github.com/zDyanTB) and [Ja.KooLit](https://github.com/JaKooLit) for creating insanely cool dotfiles
- [Gabriel Fontes](https://github.com/Misterio77) for creating comprehensive and comprehensible starting templates for NixOS and home-manager configurations

