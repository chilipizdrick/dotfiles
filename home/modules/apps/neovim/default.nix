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
    (rust-bin.nightly.latest.default.override
      {
        # extensions = ["rust-src"];
        # targets = [
        #   "riscv32imc-unknown-none-elf"
        #   "armv7-linux-androideabi"
        #   "aarch64-linux-android"
        # ];
      })
    cargo-apk
    rust-analyzer

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

    # mdformat

    gnumake
    tree-sitter
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/home/modules/apps/neovim/config";
}
