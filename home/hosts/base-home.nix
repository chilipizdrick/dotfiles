{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../modules
  ];
  nixpkgs = {
    overlays = [
      (final: prev: {
        rofi-wayland = prev.rofi-wayland.override {
          plugins = [
            (prev.rofi-calc.override {
              rofi-unwrapped = prev.rofi-wayland-unwrapped;
            })
          ];
        };
      })
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

    inputs.zen-browser.packages."${system}".default

    imv
    loupe
    gimp
    zathura

    mpv
    obsidian
    telegram-desktop
    baobab
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
