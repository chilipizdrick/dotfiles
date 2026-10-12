{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;

    plugins = [
      pkgs.tmuxPlugins.better-mouse-mode
      pkgs.tmuxPlugins.catppuccin
    ];

    extraConfig = ''
      set -g focus-events on
      set -g renumber-windows on
      set -ga terminal-overrides ",alacritty:Tc"
      set -g default-terminal alacritty
      set -g default-shell fish
      set -ga terminal-overrides ",*:RGB"
      set -ga terminal-overrides ",*:Tc"
      set -ga terminal-features ",*:usstyle"
      set -g mouse on
      set -g @catppuccin_flavor "mocha"
      set -g status-left ""
      set -g status-right ""
      set-window-option -g window-status-current-style none
    '';
  };

  home.packages = [pkgs.tmux-sessionizer];

  xdg.configFile."tms/config.toml".text =
    # toml
    ''
      [[search_dirs]]
      path = "$HOME/projects"
      depth = 1

      [[search_dirs]]
      path = "$HOME/dotfiles"
      depth = 0
    '';
}
