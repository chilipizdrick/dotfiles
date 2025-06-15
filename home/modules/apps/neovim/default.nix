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
    llvmPkgs = llvmPackages;
  in [
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt

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

    go

    julia

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

  xdg.configFile."clippy/clippy.toml".text =
    # toml
    ''
      [lints.clippy]
      enum_glob_use = "deny"
      pedantic = "deny"
      nursery = "deny"
      unwrap_used = "deny"
    '';

  home.sessionVariables.CLIPPY_CONF_DIR = "$HOME/.config/clippy";

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Projects/nix/dotfiles/home/modules/apps/neovim/config";
}
