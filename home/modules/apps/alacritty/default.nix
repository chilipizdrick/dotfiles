{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
  };
  home.file.".config/alacritty/alacritty.toml".text =
    # toml
    ''
      [window]
      padding = { x = 4, y = 4 }
      decorations = "none"
      opacity = 0.8
      blur = true
      startup_mode = "maximized"
      decorations_theme_variant = "dark"

      [font]
      bold_italic = { family = "JetBrainsMonoNL Nerd Font", style = "BoldItalic" }
      normal = { family = "JetBrainsMonoNL Nerd Font", style = "Regular" }
      bold = { family = "JetBrainsMonoNL Nerd Font", style = "Bold" }
      italic = { family = "JetBrainsMonoNL Nerd Font", style = "Italic" }

      [colors.primary]
      background = "#000000"
      foreground = "#cdd6f4"
      dim_foreground = "#7f849c"
      bright_foreground = "#cdd6f4"

      [colors.cursor]
      text = "#1e1e2e"
      cursor = "#cdd6f4"

      [colors.vi_mode_cursor]
      text = "#1e1e2e"
      cursor = "#b4befe"

      [colors.search.matches]
      foreground = "#1e1e2e"
      background = "#a6adc8"

      [colors.search.focused_match]
      foreground = "#1e1e2e"
      background = "#a6e3a1"

      [colors.footer_bar]
      foreground = "#1e1e2e"
      background = "#a6adc8"

      [colors.hints.start]
      foreground = "#1e1e2e"
      background = "#f9e2af"

      [colors.hints.end]
      foreground = "#1e1e2e"
      background = "#a6adc8"

      [colors.selection]
      text = "#1e1e2e"
      background = "#f5e0dc"

      [colors.normal]
      black = "#45475a"
      red = "#f38ba8"
      green = "#a6e3a1"
      yellow = "#f9e2af"
      blue = "#89b4fa"
      magenta = "#f5c2e7"
      cyan = "#94e2d5"
      white = "#bac2de"

      [colors.bright]
      black = "#585b70"
      red = "#f38ba8"
      green = "#a6e3a1"
      yellow = "#f9e2af"
      blue = "#89b4fa"
      magenta = "#f5c2e7"
      cyan = "#94e2d5"
      white = "#a6adc8"

      [colors.dim]
      black = "#45475a"
      red = "#f38ba8"
      green = "#a6e3a1"
      yellow = "#f9e2af"
      blue = "#89b4fa"
      magenta = "#f5c2e7"
      cyan = "#94e2d5"
      white = "#bac2de"

      [[colors.indexed_colors]]
      index = 16
      color = "#fab387"

      [[colors.indexed_colors]]
      index = 17
      color = "#f5e0dc"
    '';

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
