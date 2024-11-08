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
      (final: _prev: import ../../pkgs pkgs)
      (final: _prev: {scripts = import ../../pkgs/scripts pkgs;})
      (final: prev: {
        rofi-wayland = prev.rofi-wayland.override {
          plugins = [
            (pkgs.rofi-calc.override {
              rofi-unwrapped = pkgs.rofi-wayland-unwrapped;
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

  # Enable home-manager
  programs.home-manager.enable = true;

  # Add remaining packages
  home.packages = with pkgs; [
    openvpn
    baobab
    imv
    loupe
    gimp
    zathura
    mpv
    brave
    obsidian
    telegram-desktop
    chromium
    inputs.zen-browser.packages."${system}".default
    mathematica

    ani-cli
  ];

  # Fixes for electron apps
  xdg.desktopEntries = {
    spotify-xwayland = {
      type = "Application";
      name = "Spotify on Xwayland";
      genericName = "Music Player";
      icon = "spotify-client";
      exec = "env -u WAYLAND_DISPLAY spotify %U";
      terminal = false;
      mimeType = ["x-scheme-handler/spotify"];
      categories = ["Audio" "Music" "Player" "AudioVideo"];
      settings = {
        StartupWMClass = "spotify";
      };
    };
  };

  # --command=soundux in .desktop file prevents Soundux from launching properly
  # xdg.desktopEntries = {
  #   soundux-fix = {
  #     categories = ["Audio" "Music" "Player" "AudioVideo"];
  #     exec = "flatpak run --branch=stable --arch=x86_64 --file-forwarding io.github.Soundux @@u %U @@";
  #     comment = "A universal soundboard that uses PulseAudio modules or PipeWire linking";
  #     genericName = "SoundBoard";
  #     icon = "io.github.Soundux";
  #     name = "Soundux *FIX*";
  #     type = "Application";
  #     terminal = false;
  #     settings = {
  #       StartupWMClass = "Soundux";
  #       X-Flatpak = "io.github.Soundux";
  #     };
  #   };
  # };

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
