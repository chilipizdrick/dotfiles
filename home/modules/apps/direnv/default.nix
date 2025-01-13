{...}: {
  programs.direnv = {
    enable = true;
    silent = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
}
