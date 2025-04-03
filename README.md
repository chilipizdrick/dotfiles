<h1 align="center">
    Chilipizdrick's NixOS dotfiles
</h1>

<img alt="Workspace" src="https://github.com/user-attachments/assets/2adb27ca-bf09-46e5-bff4-f40ddd374e6e" width="100%">
<div align="center">
    <img alt="Lockscreen" src="https://github.com/user-attachments/assets/e8228a5b-b354-4a6f-99bb-0b603ca9a02b" width="49%">
    <img alt="Wallpaper Picker" src="https://github.com/user-attachments/assets/4b9bfb6a-45fd-401f-8462-6bbe6b2885a1" width="49%">
    <img alt="App Launcher" src="https://github.com/user-attachments/assets/dcea186d-9963-4b42-90b3-432f0c27946c" width="49%">
    <img alt="Power Menu" src="https://github.com/user-attachments/assets/dab898d8-c1f9-405d-9e9c-6d24b8a15784" width="49%">
    <img alt="Neovim" src="https://github.com/user-attachments/assets/7e93e7c3-f746-4763-be55-1ea6dbd6d474" width="49%">
    <img alt="Zen Browser" src="https://github.com/user-attachments/assets/1a21a5c3-5448-418d-86c5-095b22e49fad" width="49%">
</div>

> [!WARNING]
> These dotfiles are created for personal use and assume my workflow. Use at your own risk.

## Prerequisites

- Installation of NixOS

## Installation

> [!IMPORTANT]
> Replace `<host>` below with preferred host configuration (one of `atlas`, `aurora`).

```bash
export NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#git
git clone --depth 1 https://github.com/chilipizdrick/dotfiles.git
cd dotfiles
cp -f /etc/nixos/hardware-configuration.nix ./nixos/hosts/<host>/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#<host>
home-manager switch --flake .
```

## Thanks to

- [zDyant](https://github.com/zDyanTB) and [Ja.KooLit](https://github.com/JaKooLit) for creating insanely cool dotfiles
- [Gabriel Fontes](https://github.com/Misterio77) for creating comprehensive and comprehensible starting templates for NixOS and home-manager configurations

