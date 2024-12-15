{...}: {
  programs.nushell = {
    enable = true;
    shellAliases = {
      l = "ls -l";
      ll = "ls -l";
      la = "ls -a";
      gadd = "git add .";
      tmux = "with-env {TERM: \"tmux-256color\"} {tmux -u}";
      tms = "with-env {TERM: \"tmux-256color\"} {tms}";
      nrs = "sudo nixos-rebuild switch --flake .";
      hms = "home-manager switch --flake .";
    };
    extraEnv =
      # nu
      ''
        $env.EDITOR = "nvim"
        $env.TERMINAL = "alacritty"
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
