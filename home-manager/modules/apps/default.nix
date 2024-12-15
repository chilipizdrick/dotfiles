{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # ./firefox
    # ./flatpak
    ./cava
    ./discord
    ./starship
    ./git
    ./tmux
    ./zsh
    ./nushell
    ./neovim
    ./alacritty
    ./zoxide
    ./spotify
    ./udiskie
    ./direnv
    ./yazi
    ./carapace
  ];

  home.packages = with pkgs; [
    # CLI
    openvpn
    ani-cli

    # GUI
    helvum
    chromium
    inputs.zen-browser.packages."${system}".default

    imv
    loupe
    gimp
    zathura

    mpv
    obsidian
    telegram-desktop
    obs-studio
    baobab
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
