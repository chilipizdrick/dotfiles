{pkgs, ...}: {
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;
  };
  home.file.".config/wlogout/layout".source = ./config/layout;
  home.file.".config/wlogout/style.css".source = ./config/style.css;
  home.file.".config/wlogout/icons".source = ./config/icons;
  home.file.".config/wlogout/themes/catppuccin-mocha.css".source = ./config/catppuccin-mocha.css;
}
