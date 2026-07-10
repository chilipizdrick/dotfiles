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
      # variables = ["--all"];
    };

    extraConfig = builtins.readFile ./config.lua;
  };

  # services.hyprpolkitagent.enable = true;

  home.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    # brightnessctl
    # hypridle
    # hyprlock
    # libnotify
    # networkmanagerapplet
    # pavucontrol
    # playerctl
    # vicinae
    # wireplumber
    # wlogout
    grim
    hyprpicker
    killall
    nautilus
    procps
    satty
    slurp
    wl-clipboard

    inputs'.wroomer.packages.wroomer-wayland

    # self'.packages.reload-graphical-interface
    # self'.packages.select-wallpaper
    # self'.packages.toggle-caffeine-mode
    # self'.packages.toggle-systemd-user-service
    self'.packages.clever-hijacker
    self'.packages.pw-connect
    self'.packages.satty-screenshot
  ];

  # systemd.user.services.nm-applet = {
  #   Unit = {
  #     Description = "Network Manager Applet";
  #     PartOf = ["graphical-session.target"];
  #     After = ["graphical-session.target"];
  #   };
  #
  #   Service = {
  #     ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet";
  #     Restart = "on-failure";
  #     RestartSec = 3;
  #   };
  #
  #   Install = {
  #     WantedBy = ["graphical-session.target"];
  #   };
  # };

  home.file."Pictures/wallpapers".source = pkgs.fetchFromGitHub {
    owner = "chilipizdrick";
    repo = "wallpapers";
    rev = "d4e123767481965c62a8deef90115db8756fe4f3";
    sha256 = "sha256-rr4Zhp+o9MQGq56vL1k97+cA10UGP4w55ty87T/FJiE=";
  };
}
