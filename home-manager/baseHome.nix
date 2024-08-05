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
    baobab
    imv
    loupe
    gimp
    zathura
    amberol
    mpv

    brave

    telegram-desktop
    (discord.override {
      withVencord = true;
      vencord = unstable.vencord;
    })
    vesktop

    obsidian

    ani-cli
    qbittorrent

    unstable.wallust

    gnome.gnome-software
  ];

  # --command=soundux in .desktop file prevents Soundux from launching properly
  xdg.desktopEntries = {
    soundux-fix = {
      categories = ["Audio" "Music" "Player" "AudioVideo"];
      exec = "flatpak run --branch=stable --arch=x86_64 --file-forwarding io.github.Soundux @@u %U @@";
      comment = "A universal soundboard that uses PulseAudio modules or PipeWire linking";
      genericName = "SoundBoard";
      icon = "io.github.Soundux";
      name = "Soundux *FIX*";
      type = "Application";
      terminal = false;
      settings = {
        StartupWMClass = "Soundux";
        X-Flatpak = "io.github.Soundux";
      };
    };
  };

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
