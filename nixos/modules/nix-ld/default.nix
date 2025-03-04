{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs.glfw
    ];
  };
}
