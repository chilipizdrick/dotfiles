{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    # package = pkgs.unstable.neovim;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = true;
    withPython3 = true;
    withNodeJs = true;
  };

  home.file.".config/nvim".source = ./config;
}
