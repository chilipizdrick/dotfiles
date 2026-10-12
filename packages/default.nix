pkgs: {
  helium-browser = pkgs.callPackage ./helium-browser.nix {};
  probe-rs-udev-rules = pkgs.callPackage ./probe-rs-udev-rules {};
  daemonologist = pkgs.callPackage ./daemonologist {};
}
