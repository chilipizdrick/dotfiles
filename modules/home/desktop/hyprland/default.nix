{
  pkgs,
  inputs',
  self',
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;
    extraConfig = builtins.readFile ./config.lua;
  };

  home.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    grim
    hyprpicker
    killall
    libnotify
    nautilus
    procps
    satty
    slurp
    uwsm
    wl-clipboard

    inputs'.wroomer.packages.wroomer-wayland

    self'.packages.clever-hijacker
    self'.packages.pw-connect
    self'.packages.satty-screenshot
    self'.packages.daemonologist
  ];

  home.file."Pictures/wallpapers".source = pkgs.fetchFromGitHub {
    owner = "chilipizdrick";
    repo = "wallpapers";
    rev = "d4e123767481965c62a8deef90115db8756fe4f3";
    sha256 = "sha256-rr4Zhp+o9MQGq56vL1k97+cA10UGP4w55ty87T/FJiE=";
  };
}
