{
  pkgs,
  config,
  inputs,
  ...
}: let
  self = inputs.self;
in {
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

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink (builtins.unsafeDiscardStringContext "${self}/home-manager/modules/apps/neovim/config");
}
