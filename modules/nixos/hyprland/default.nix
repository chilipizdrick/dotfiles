{
  pkgs,
  inputs,
  ...
}: {
  # So hyprland wiki says that this module is important and blah blah blah,
  # but it makes everyting worse on my machines so I did not enable it
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland; # Hyprland 0.42.0 is flaky for me at the moment
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
}
