pkgs: {
  clever-hijacker = pkgs.callPackage ./clever-hijacker.nix {};
  toggle-systemd-user-service = pkgs.callPackage ./toggle-systemd-user-service.nix {};
  satty-screenshot = pkgs.callPackage ./satty-screenshot.nix {};
  helium-browser = pkgs.callPackage ./helium-browser.nix {};
  probe-rs-udev-rules = pkgs.callPackage ./probe-rs-udev-rules {};
  pw-connect = pkgs.callPackage ./pw-connect {};
}
