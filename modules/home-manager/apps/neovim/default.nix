{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = true;
    withPython3 = true;
    withNodeJs = true;
  };

  home.packages = with pkgs; [gcc_multi go cargo];

  home.file.".config/nvim".source = ./config;
}
