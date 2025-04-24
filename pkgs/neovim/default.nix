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
    set runtimepath^=${./config}
    source ${./config}/init.lua
  '';

  neovimConfig = neovimUtils.makeNeovimConfig {
    withPython3 = false;
    withNodeJs = false;
    withRuby = false;
    wrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      "${lib.makeBinPath extraPackages}"
    ];
    extraLuaPackages = p: with p; [magick fd ripgrep];
    inherit extraPackages customRC;
  };

  nvim = wrapNeovimUnstable neovim-unwrapped neovimConfig;
in
  buildFHSEnv {
    name = "nvim";
    lua = neovim-unwrapped.lua;
    meta = {
      description = "Chilipizdrick's neovim config budled into a nix package.";
      license = with lib.licenses; [mit apsl20];
      platforms = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      maintainers = [];
    };
    targetPkgs = _: [nvim];
    runScript = writeShellScript "nvim-fhs.sh" ''
      exec ${nvim}/bin/nvim "$@"
    '';
  }
