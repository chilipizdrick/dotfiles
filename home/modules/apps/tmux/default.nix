{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.catppuccin
      # tmuxPlugins.kanagawa
    ];

    extraConfig = ''
      set -g focus-events on
      set -g renumber-windows on

      set-option -ga terminal-overrides ",alacritty:Tc"
      set -g default-terminal "alacritty"

      set -ga terminal-overrides ",*:RGB"
      set -ga terminal-overrides ",*:Tc"
      set -ga terminal-features ",*:usstyle"

      # Mouse config
      set-option -g mouse on

      # Kanagawa theme confifg
      # set -g @kanagawa-theme 'dragon'
      # set -g @kanagawa-ignore-window-colors true
      # set -g @kanagawa-show-location false
      # set -g @kanagawa-show-location false
      # set -g @kanagawa-show-timezone false
      # set -g @kanagawa-show-timezone false

      # Catppuccin theme config
      set -g @catppuccin_flavor "mocha"
      set -g status-left ""
      set -g status-right ""
      # set -g @catppuccin_window_status_style "rounded"
      # set -g status-right-length 100
      # set -g status-left-length 100
      # set -g status-right "#{E:@catppuccin_status_application}"
      # set -ag status-right "#{E:@catppuccin_status_session}"
      # set -ag status-right "#{E:@catppuccin_status_uptime}"

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
