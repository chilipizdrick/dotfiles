{
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ../modules/home-manager
  ];
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Add remaining packages
  home.packages = with pkgs; [
    openvpn

    gnome.nautilus
    ranger
    baobab
    imv
    loupe
    gimp
    zathura
    amberol
    mpv
    vlc

    chromium

    telegram-desktop
    (discord.override {
      withVencord = true;
      vencord = unstable.vencord;
    })
    vesktop

    obsidian

    ani-cli
    # ventoy
    qbittorrent

    unstable.wallust
  ];

  # Set default apps for some applications
  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
