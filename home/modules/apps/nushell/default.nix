{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nushell = {
    enable = true;
    shellAliases = lib.mkForce (builtins.removeAttrs config.home.shellAliases ["nau"]);

    extraEnv =
      # nu
      ''
        $env.EDITOR = "nvim"
        $env.TERMINAL = "ghostty"
        $env.BROWSER = "zen"
        $env.PROMPT_INDICATOR = ""
        $env.PROMPT_INDICATOR_VI_INSERT = ""
        $env.PROMPT_INDICATOR_VI_NORMAL = " "
        $env.PROMPT_MULTILINE_INDICATOR = ""
      '';

    extraConfig = let
      themeRepo = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "nushell";
        rev = "82c31124b39294c722f5853cf94edc01ad5ddf34";
        sha256 = "sha256-O95OrdF9UA5xid1UlXzqrgZqw3fBpTChUDmyExmD2i4=";
      };
    in
      # nu
      ''
        source ${themeRepo}/themes/catppuccin_mocha.nu

        $env.config = {
          show_banner: false,
          edit_mode: vi,
          cursor_shape: {
            vi_insert: line,
            vi_normal: block,
          },
        }
      '';
  };
}
