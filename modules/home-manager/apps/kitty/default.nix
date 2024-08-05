{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;

      background = "#000000";
      background_opacity = "0.75";
      window_padding_width = 3;

      font_family = "JetBrainsMonoNL Nerd Font";
      bold_font = "JetBrainsMonoNL Nerd Font Bold";
      italic_font = "JetBrainsMonoNL Nerd Font Italic";
      bold_italic_font = "JetBrainsMonoNL Nerd Font BoldItalic";
    };
    shellIntegration.enableZshIntegration = true;
    theme = "Rosé Pine";
  };
}
