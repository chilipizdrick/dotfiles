{pkgs, ...}: {
  # Install fonts
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      vistafonts
      corefonts
      noto-fonts-cjk
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      jetbrains-mono
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
  };
}
