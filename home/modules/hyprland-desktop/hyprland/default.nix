{
  pkgs,
  inputs',
  self',
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    extraConfig = builtins.readFile ./config.lua;
  };

  services.hyprpolkitagent.enable = true;

  home.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    brightnessctl
    grim
    hypridle
    hyprlock
    hyprpicker
    killall
    networkmanagerapplet
    pavucontrol
    playerctl
    procps
    satty
    slurp
    vicinae
    wireplumber
    wl-clipboard
    wlogout
    xrdb

    inputs'.wroomer.packages.wroomer-wayland

    self'.packages.clever-hijacker
    self'.packages.reload-graphical-interface
    self'.packages.satty-screenshot
    self'.packages.select-wallpaper
    self'.packages.toggle-caffeine-mode
    self'.packages.toggle-systemd-user-service
  ];

  systemd.user.services.nm-applet = {
    Unit = {
      Description = "Network Manager Applet";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet";
      Restart = "on-failure";
      RestartSec = 3;
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };

  home.file."Pictures/wallpapers".source = pkgs.fetchFromGitHub {
    owner = "chilipizdrick";
    repo = "wallpapers";
    rev = "d4e123767481965c62a8deef90115db8756fe4f3";
    sha256 = "sha256-rr4Zhp+o9MQGq56vL1k97+cA10UGP4w55ty87T/FJiE=";
  };
}
