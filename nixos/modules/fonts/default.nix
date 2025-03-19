{pkgs, ...}: {
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      corefonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];
  };
}
