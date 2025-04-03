{config, ...}: {
  programs.nushell = {
    enable = true;
    shellAliases = builtins.removeAttrs config.home.shellAliases ["nau"];

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

    extraConfig =
      # nu
      ''
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
