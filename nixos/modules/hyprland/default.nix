{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    hyprland-qtutils
  ];
}
