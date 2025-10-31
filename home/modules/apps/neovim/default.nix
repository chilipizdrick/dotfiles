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

  home.packages = with pkgs; let
    llvmPkgs = pkgs.llvmPackages;
  in [
    rustup
    # cargo
    # clippy
    # rustc
    # rustfmt
    # rust-analyzer

    wgsl-analyzer

    python3
    python3Packages.pip
    pyright

    nodejs

    llvmPkgs.clang
    llvmPkgs.lldb
    llvmPkgs.clang-tools

    lua51Packages.lua
    luajitPackages.luarocks
    lua-language-server
    stylua

    typescript-language-server

    go

    nixd

    fixjson

    typst
    tinymist
    typstyle

    shfmt

    mdformat

    gnumake
    tree-sitter
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Projects/nix/dotfiles/home/modules/apps/neovim/config";
}
