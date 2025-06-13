{...}: {
  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-feature = "-calt,-liga,-dlig";
      font-size = 12;

      window-padding-x = 5;
      window-padding-y = 5;

      theme = "catppuccin-mocha";
      background = "#000000";
      foreground = "#cdd6f4";
      background-opacity = 0.7;

      keybind = [
        "ctrl+comma=open_config"
        "ctrl+shift+comma=reload_config"

        "ctrl+shift+o=new_split:right"
        "ctrl+shift+e=new_split:down"
        "ctrl+alt+h=goto_split:left"
        "ctrl+alt+j=goto_split:bottom"
        "ctrl+alt+k=goto_split:top"
        "ctrl+alt+l=goto_split:right"
        "ctrl+shift+alt+h=resize_split:left,10"
        "ctrl+shift+alt+j=resize_split:down,10"
        "ctrl+shift+alt+k=resize_split:up,10"
        "ctrl+shift+alt+l=resize_split:right,10"
        "ctrl+shift+enter=toggle_split_zoom"

        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+a=select_all"

        "shift+left=adjust_selection:left"
        "shift+down=adjust_selection:down"
        "shift+up=adjust_selection:up"
        "shift+right=adjust_selection:right"

        "ctrl+minus=decrease_font_size:1"
        "ctrl+equal=increase_font_size:1"
        "ctrl+plus=increase_font_size:1"
        "ctrl+zero=reset_font_size"

        "ctrl+shift+page_up=jump_to_prompt:-1"
        "ctrl+shift+page_down=jump_to_prompt:1"

        "shift+page_down=scroll_page_down"
        "shift+page_up=scroll_page_up"
        "shift+end=scroll_to_bottom"
        "shift+home=scroll_to_top"

        "ctrl+alt+shift+j=write_scrollback_file:open"
        "ctrl+shift+j=write_scrollback_file:paste"

        "ctrl+shift+w=close_surface"
        "ctrl+shift+i=inspector:toggle"

        "ctrl+shift+t=new_tab"
        "ctrl+shift+h=previous_tab"
        "ctrl+shift+l=next_tab"
        "ctrl+shift+tab=previous_tab"
        "ctrl+tab=next_tab"
        "alt+one=goto_tab:1"
        "alt+two=goto_tab:2"
        "alt+three=goto_tab:3"
        "alt+four=goto_tab:4"
        "alt+five=goto_tab:5"
        "alt+six=goto_tab:6"
        "alt+seven=goto_tab:7"
        "alt+eight=goto_tab:8"
        "alt+nine=goto_tab:9"
      ];

      clipboard-read = "allow";
      clipboard-write = "allow";

      resize-overlay = "never";

      window-decoration = false;

      term = "xterm-ghostty";

      copy-on-select = true;
      confirm-close-surface = false;
      cursor-style = "block";
      cursor-style-blink = false;
      cursor-color = "#cdd6f4";
      cursor-text = "#1e1e2e";

      shell-integration-features = "no-cursor,sudo,no-title";

      gtk-single-instance = true;
      gtk-titlebar = false;
      gtk-wide-tabs = false;
      gtk-adwaita = false;
      auto-update = "off";
    };
  };

  home.sessionVariables.TERMINAL = "ghostty";

  # home.packages = with pkgs; [
  #   ghostty
  # ];

  # xdg.configFile."ghostty/config".source = ./config;
}
