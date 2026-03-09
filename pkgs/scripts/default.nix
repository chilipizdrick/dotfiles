pkgs: {
  clipboard = pkgs.callPackage ./clipboard {};
  select-wallpaper = pkgs.callPackage ./select-wallpaper {};
  showcase = pkgs.callPackage ./showcase {};
  spread-propaganda = pkgs.callPackage ./spread-propaganda {};
  get-player-metadata = pkgs.callPackage ./get-player-metadata.nix {};
  hijacker-lite = pkgs.callPackage ./hijacker-lite.nix {};
  load-album-cover = pkgs.callPackage ./load-album-cover.nix {};
  ocr = pkgs.callPackage ./ocr.nix {};
  query-tailscale = pkgs.callPackage ./query-tailscale.nix {};
  query-zapret = pkgs.callPackage ./query-zapret.nix {};
  record-screen = pkgs.callPackage ./record-screen.nix {};
  reload-graphical-interface = pkgs.callPackage ./reload-graphical-interface.nix {};
  setup-workflow-atlas = pkgs.callPackage ./setup-workflow-atlas.nix {};
  setup-workflow-aurora = pkgs.callPackage ./setup-workflow-aurora.nix {};
  toggle-caffeine-mode = pkgs.callPackage ./toggle-caffeine-mode.nix {};
  toggle-hyprland-layout = pkgs.callPackage ./toggle-hyprland-layout.nix {};
  toggle-hyprland-settings = pkgs.callPackage ./toggle-hyprland-settings.nix {};
  toggle-systemd-user-service = pkgs.callPackage ./toggle-systemd-user-service.nix {};
  toggle-tailscale = pkgs.callPackage ./toggle-tailscale.nix {};
  toggle-zapret = pkgs.callPackage ./toggle-zapret.nix {};
  xdph-picker = pkgs.callPackage ./xdph-picker.nix {};
}
