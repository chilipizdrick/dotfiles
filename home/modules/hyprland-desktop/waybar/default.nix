{pkgs, ...} @ args: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
    settings = import ./config.nix args;
  };

  home.packages = with pkgs; [playerctl];

  # xdg.configFile."waybar/style.css".source =
  #   config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/Projects/nix/dotfiles/home/modules/hyprland-desktop/waybar/style.css";
}
