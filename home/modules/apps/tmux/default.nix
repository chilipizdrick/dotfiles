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

      # Catppuccin theme config
      set -g @catppuccin_flavor "mocha"
      set -g status-left ""
      set -g status-right ""
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
