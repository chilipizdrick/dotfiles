<h1 align="center">
    Chilipizdrick's NixOS dotfiles
</h1>

<img alt="Workspace" src="https://github.com/user-attachments/assets/38032688-8f8a-4b90-8be0-9e846f64d166" width="100%">
<div align="center">
    <img alt="Lockscreen" src="https://github.com/user-attachments/assets/b727cf91-0a62-4086-91d5-7f1252b7bb25" width="49%">
    <img alt="App Launcher" src="https://github.com/user-attachments/assets/83245973-421d-4bd6-a616-b16fd93dd9df" width="49%">
    <img alt="Wallpaper Picker" src="https://github.com/user-attachments/assets/710fd3d5-dd58-4520-9053-f2259a8c94ea" width="49%">
    <img alt="Power Menu" src="https://github.com/user-attachments/assets/9ecdc352-c238-494c-93be-fa251f1f43e0" width="49%">
    <img alt="Neovim" src="https://github.com/user-attachments/assets/22a7c742-b394-49b9-a38d-e897d11a2d68" width="49%">
    <img alt="Zen Browser" src="https://github.com/user-attachments/assets/4457817e-2b09-4f90-96a9-fdc4a78b45bc" width="49%">
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

