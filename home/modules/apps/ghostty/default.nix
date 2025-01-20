{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
  ];

  home.file.".config/ghostty/config".text = ''
    font-family = "JetBrainsMono NL"
    font-family-bold = "JetBrainsMono Nerd Font, Bold"
    font-family-italic = "JetBrainsMono Nerd Font, Italic"
    font-family-bold-italic = "JetBrainsMono Nerd Font, Bold Italic"
    font-feature = -liga
    font-size = 12

    theme = "catppuccin-mocha"
    background = #000000
    # foreground = #ffffff
    background-opacity = 0.8

    keybind = ctrl+comma=open_config
    keybind = ctrl+alt+k=goto_split:top
    keybind = ctrl+page_down=next_tab
    keybind = ctrl+shift+v=paste_from_clipboard
    keybind = shift+insert=paste_from_selection
    keybind = ctrl+shift+a=select_all
    keybind = shift+up=adjust_selection:up
    keybind = alt+five=goto_tab:5
    keybind = ctrl+shift+alt+right_bracket=goto_split:next
    keybind = ctrl+equal=increase_font_size:1
    keybind = ctrl+shift+o=new_split:right
    keybind = ctrl+shift+c=copy_to_clipboard
    keybind = ctrl+shift+q=quit
    keybind = ctrl+shift+page_down=jump_to_prompt:1
    keybind = ctrl+shift+comma=reload_config
    keybind = ctrl+minus=decrease_font_size:1
    keybind = shift+left=adjust_selection:left
    keybind = ctrl+shift+alt+k=resize_split:up,10
    keybind = alt+eight=goto_tab:8
    keybind = shift+page_up=scroll_page_up
    keybind = ctrl+alt+shift+j=write_scrollback_file:open
    keybind = ctrl+shift+h=previous_tab
    keybind = ctrl+shift+w=close_surface
    keybind = ctrl+shift+alt+equal=equalize_splits
    keybind = shift+end=scroll_to_bottom
    keybind = ctrl+zero=reset_font_size
    keybind = alt+three=goto_tab:3
    keybind = ctrl+shift+j=write_scrollback_file:paste
    keybind = ctrl+enter=toggle_fullscreen
    keybind = ctrl+page_up=previous_tab
    keybind = shift+right=adjust_selection:right
    keybind = ctrl+tab=next_tab
    keybind = ctrl+alt+h=goto_split:left
    keybind = shift+page_down=scroll_page_down
    keybind = ctrl+shift+l=next_tab
    keybind = ctrl+shift+page_up=jump_to_prompt:-1
    keybind = alt+nine=goto_tab:9
    keybind = ctrl+shift+t=new_tab
    keybind = shift+down=adjust_selection:down
    keybind = ctrl+shift+alt+h=resize_split:left,10
    keybind = ctrl+shift+tab=previous_tab
    keybind = alt+two=goto_tab:2
    keybind = ctrl+alt+j=goto_split:bottom
    keybind = ctrl+shift+alt+j=resize_split:down,10
    keybind = ctrl+shift+alt+l=resize_split:right,10
    keybind = ctrl+plus=increase_font_size:1
    keybind = alt+four=goto_tab:4
    keybind = ctrl+shift+e=new_split:down
    keybind = ctrl+alt+l=goto_split:right
    keybind = alt+f4=close_window
    keybind = alt+one=goto_tab:1
    keybind = ctrl+shift+enter=toggle_split_zoom
    keybind = shift+home=scroll_to_top
    keybind = ctrl+shift+alt+left_bracket=goto_split:previous
    keybind = ctrl+shift+i=inspector:toggle
    keybind = alt+six=goto_tab:6
    keybind = alt+seven=goto_tab:7

    window-padding-x = 2
    window-padding-y = 2

    resize-overlay = never

    window-decoration = false

    copy-on-select = true
    confirm-close-surface = false

    shell-integration = zsh
    shell-integration-features = no-cursor,sudo,no-title
    linux-cgroup = never

    gtk-single-instance = false
    gtk-titlebar = false
    gtk-wide-tabs = false
    gtk-adwaita = false
    auto-update = off
  '';
}
