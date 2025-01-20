{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = true;
    withPython3 = true;
    withNodeJs = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    gcc_multi
    cargo
    go
    nodejs
    julia
    python3
    python3Packages.pip
    lua51Packages.lua
    luajitPackages.luarocks

    tree-sitter
    nixd
  ];

  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Projects/nix/dotfiles/home/modules/apps/neovim/config";
}
