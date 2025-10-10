{pkgs, ...}: let
  helium-browser = pkgs.callPackage ./helium-browser.nix {};
in {
  home.packages = [
    helium-browser
  ];
}
