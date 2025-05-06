{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.catppuccin
    ];

    extraConfig = ''
      set -g focus-events on

      # Color config
      set -g default-terminal "''${TERM}"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
      set-environment -g COLORTERM "truecolor"

      # Mouse config
      set-option -g mouse on

      # Catppuccin theme config
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"

    '';
  };

  home.packages = with pkgs; [tmux-sessionizer];

  xdg.configFile."tms/config.toml".text =
    # toml
    ''
      [[search_dirs]]
      path = "$HOME/Projects"
      depth = 2
    '';
}
