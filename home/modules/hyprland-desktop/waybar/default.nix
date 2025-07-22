{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./config.nix
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    # style = builtins.readFile ./style.css;
  };

  home.packages = with pkgs; [playerctl];

  # xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/style.css".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Projects/nix/dotfiles/home/modules/hyprland-desktop/waybar/style.css";

  xdg.configFile."waybar/catppuccin-mocha.css".source = ./catppuccin-mocha.css;
}
