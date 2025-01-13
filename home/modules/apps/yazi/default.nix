{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
      };
    };
    package = pkgs.yazi;
  };
}
