{pkgs, ...}: {
  imports = [
    ./config.nix
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = with pkgs; [playerctl];

  xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/catppuccin-mocha.css".source = ./catppuccin-mocha.css;
}
