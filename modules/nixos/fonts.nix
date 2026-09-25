{pkgs, ...}: {
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      corefonts
      inter
      open-sans
      jetbrains-mono
      liberation_ttf
      nerd-fonts.jetbrains-mono
      monocraft
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };
}
