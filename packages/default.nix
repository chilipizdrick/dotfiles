pkgs: {
  toggle-systemd-user-service = pkgs.callPackage ./toggle-systemd-user-service.nix {};
  satty-screenshot = pkgs.callPackage ./satty-screenshot.nix {};
  helium-browser = pkgs.callPackage ./helium-browser.nix {};
  probe-rs-udev-rules = pkgs.callPackage ./probe-rs-udev-rules {};
  daemonologist = pkgs.callPackage ./daemonologist {};
}
