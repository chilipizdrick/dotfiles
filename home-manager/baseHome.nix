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
    # libreoffice

    chromium

    spotify

    telegram-desktop
    (discord.override {
      withVencord = true;
      vencord = unstable.vencord;
    })
    vesktop

    obsidian
    # anki

    ani-cli
    # ventoy
    qbittorrent

    wallust
  ];

  # Set default apps for some applications
  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  # Set default applications
  xdg.mimeApps.enable = true;
  xdg.mimeApps = {
    defaultApplications = {
      "inode/directory" = "org.gnome.Nautilus.desktop";

      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";

      "application/pdf" = ["org.pwmt.zathura.desktop" "firefox.desktop"];
      "application/doc" = "libreoffice-writer.desktop";
      "application/docx" = "libreoffice-writer.desktop";
      "application/msword" = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";

      "image/png" = ["imv.desktop" "gimp.desktop"];
      "image/jpg" = ["imv.desktop" "gimp.desktop"];
      "image/jpeg" = ["imv.desktop" "gimp.desktop"];
      "image/webp" = ["imv.desktop" "gimp.desktop"];
      "image/gif" = ["imv.desktop" "gimp.desktop"];

      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";

      "audio/aac" = "io.bassi.Amberol.desktop";
      "audio/mpeg" = "io.bassi.Amberol.desktop";
      "audio/ogg" = "io.bassi.Amberol.desktop";
      "audio/wav" = "io.bassi.Amberol.desktop";
      "audio/webm" = "io.bassi.Amberol.desktop";
      "audio/flac" = "io.bassi.Amberol.desktop";
      "audio/m4a" = "io.bassi.Amberol.desktop";
      "audio/opus" = "io.bassi.Amberol.desktop";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
