{
  lib,
  buildFHSEnv,
  neovim-unwrapped,
  wrapNeovimUnstable,
  neovimUtils,
  writeShellScript,
  clang,
  clang-tools,
  lldb,
  python3,
  python3Packages,
  nodejs,
  lua,
  luarocks,
  typst,
  rustc,
  cargo,
  pyright,
  lua-language-server,
  nixd,
  tinymist,
  rust-analyzer,
  stylua,
  shfmt,
  fixjson,
  alejandra,
  typstyle,
  mdformat,
  rustfmt,
  clippy,
  gnumake,
  tree-sitter,
  chafa,
  fd,
  ripgrep,
  withDevTools ? true,
  withLangugages ? true,
  withLSPs ? true,
  withDebuggers ? true,
  withFormatters ? true,
  withLinters ? true,
  ...
}: let
  languages = [
    clang
    python3
    python3Packages.pip
    nodejs
    lua
    luarocks
    typst
    rustc
    cargo
  ];

  languageServers = [
    clang-tools
    pyright
    lua-language-server
    nixd
    tinymist
    rust-analyzer
  ];

  formatters = [
    stylua
    shfmt
    fixjson
    alejandra
    typstyle
    mdformat
    rustfmt
  ];

  linters = [
    clippy
  ];

  debuggers = [
    lldb
  ];

  devTools =
    (lib.optionals (withLangugages || withDevTools) languages)
    ++ (lib.optionals (withLSPs || withDevTools) languageServers)
    ++ (lib.optionals (withFormatters || withDevTools) formatters)
    ++ (lib.optionals (withDebuggers || withDevTools) debuggers)
    ++ (lib.optionals (withLinters || withDevTools) linters);

  extraPackages =
    devTools
    ++ [
      fd
      ripgrep
      gnumake
      tree-sitter
      chafa
    ];

  customRC = ''
    set runetimepath-=$HOME/.config/nvim
    set runtimepath^=${./config}
    source ${./config}/init.lua
  '';

  neovimConfig =
    neovimUtils.makeNeovimConfig {
      withPython3 = false;
      withRuby = false;
      withNodeJs = false;
      extraLuaPackages = p:
        with p; [
          magick
          fd
          ripgrep
        ];
      inherit extraPackages customRC;
    }
    // {
      wrapperArgs = [
        "--prefix"
        "PATH"
        ":"
        "${lib.makeBinPath extraPackages}"
      ];
    };

  nvim = wrapNeovimUnstable neovim-unwrapped neovimConfig;
in
  buildFHSEnv {
    name = "nvim";
    targetPkgs = _: [nvim];
    runScript = writeShellScript "nvim-fhs.sh" ''
      exec ${nvim}/bin/nvim "$@"
    '';
  }
