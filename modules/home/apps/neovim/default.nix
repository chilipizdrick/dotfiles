{
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.neovim

    pkgs.rustc
    pkgs.cargo
    pkgs.clippy
    pkgs.rustfmt
    pkgs.rust-analyzer

    pkgs.vscode-langservers-extracted

    pkgs.taplo

    pkgs.python3
    pkgs.ruff
    pkgs.ty

    pkgs.llvmPackages.clang
    pkgs.llvmPackages.clang-tools

    pkgs.lua-language-server
    pkgs.stylua

    pkgs.nixd

    pkgs.typst
    pkgs.tinymist
    pkgs.typstyle

    pkgs.gnumake
    pkgs.tree-sitter
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/modules/home/apps/neovim/config";
}
