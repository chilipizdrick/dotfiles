pkgs: {
  get-player-metadata = pkgs.callPackage ./get-player-metadata.nix {};
  clever-hijacker = pkgs.callPackage ./clever-hijacker.nix {};
  load-album-cover = pkgs.callPackage ./load-album-cover.nix {};
  query-tailscale = pkgs.callPackage ./query-tailscale.nix {};
  reload-graphical-interface = pkgs.callPackage ./reload-graphical-interface.nix {};
  select-wallpaper = pkgs.callPackage ./select-wallpaper {};
  toggle-caffeine-mode = pkgs.callPackage ./toggle-caffeine-mode.nix {};
  toggle-systemd-user-service = pkgs.callPackage ./toggle-systemd-user-service.nix {};
  toggle-tailscale = pkgs.callPackage ./toggle-tailscale.nix {};
  satty-screenshot = pkgs.callPackage ./satty-screenshot.nix {};
  helium-browser = pkgs.callPackage ./helium-browser.nix {};
  probe-rs-udev-rules = pkgs.callPackage ./probe-rs-udev-rules {};
}
