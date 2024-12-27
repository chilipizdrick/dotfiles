{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../modules
  ];
  nixpkgs = let
    overlays = import ../../overlays {};
  in {
    overlays = [
      overlays.additions
      overlays.modifications
      overlays.scripts
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

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

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
