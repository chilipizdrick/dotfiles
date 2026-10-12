{pkgs, ...}: {
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = [
      pkgs.corefonts
      pkgs.inter
      pkgs.open-sans
      pkgs.jetbrains-mono
      pkgs.liberation_ttf
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.monocraft
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk-sans
      pkgs.noto-fonts-color-emoji
    ];
  };
}
