{pkgs, ...}: {
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = [pkgs.appimage-run];
}
