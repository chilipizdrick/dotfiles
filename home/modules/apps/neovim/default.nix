{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    neovim

    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer

    wgsl-analyzer

    python3

    llvmPackages.clang
    llvmPackages.clang-tools

    lua-language-server
    stylua

    nixd

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
