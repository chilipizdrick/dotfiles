{pkgs, ...}: {
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = with pkgs; [appimage-run];
}
