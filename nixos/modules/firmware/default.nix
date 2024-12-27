{...}: {
  imports = [
    ./video-drives
    ./printing
    ./audio.nix
    ./bluetooth.nix
    ./graphicalTablet.nix
    ./networking.nix
    ./power-management.nix
    ./time.nix
    ./touchpad.nix
    ./kernel.nix
  ];
}
