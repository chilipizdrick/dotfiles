{pkgs, ...}: {
  # programs.zed-editor = {
  #   enable = true;
  #   extensions = ["nix" "python"];
  #   themes = [];
  # };

  home.packages = with pkgs; [zed-editor-fhs];
}
