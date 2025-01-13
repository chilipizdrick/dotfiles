{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.quickshell.packages."${system}".default
  ];
  home.file.".config/quickshell".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Projects/nix/dotfiles/home/modules/hyprland-desktop/quickshell/config";
}
