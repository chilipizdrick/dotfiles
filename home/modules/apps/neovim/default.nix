{
  pkgs,
  inputs,
  config,
  ...
}: {
  nixpkgs.overlays = [inputs.rust-overlay.overlays.default];

  home.packages = with pkgs; let
    llvmPkgs = pkgs.llvmPackages;
  in [
    neovim

    rust-bin.stable.latest.default
    rust-analyzer
    bacon

    wgsl-analyzer

    python3
    pyright

    nodejs

    llvmPkgs.clang
    llvmPkgs.clang-tools

    lua51Packages.lua
    lua-language-server
    stylua

    go

    nixd
    nil

    fixjson

    typst
    tinymist
    typstyle

    gnumake
    tree-sitter
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/home/modules/apps/neovim/config";
}
