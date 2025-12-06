{
  pkgs,
  config,
  inputs,
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

  nixpkgs.overlays = [inputs.rust-overlay.overlays.default];

  home.packages = with pkgs; let
    llvmPkgs = pkgs.llvmPackages;
  in [
    (rust-bin.stable.latest.default.override
      {
        extensions = ["rust-src" "rust-std"];
        targets = ["x86_64-pc-windows-msvc"];
      })
    rust-analyzer
    cargo-xwin

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

    yamlfmt

    mdformat

    gnumake
    tree-sitter
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/home/modules/apps/neovim/config";
}
