{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.ghostty.packages."${system}".default
  ];

  home.file.".config/ghostty/config".text = ''
    font-family = "JetBrainsMono NL"
    font-family-bold = "JetBrainsMono Nerd Font, Bold"
    font-family-italic = "JetBrainsMono Nerd Font, Italic"
    font-family-bold-italic = "JetBrainsMono Nerd Font, Bold Italic"
    font-style = default
    font-style-bold = default
    font-style-italic = default
    font-style-bold-italic = default
    font-synthetic-style = bold,italic,bold-italic
    font-feature = -liga
    font-size = 12
    font-variation =
    font-variation-bold =
    font-variation-italic =
    font-variation-bold-italic =
    font-codepoint-map =
    font-thicken = false

    adjust-cell-width =
    adjust-cell-height =
    adjust-font-baseline =
    adjust-underline-position =
    adjust-underline-thickness =
    adjust-strikethrough-position =
    adjust-strikethrough-thickness =
    adjust-overline-position =
    adjust-overline-thickness =
    adjust-cursor-thickness =
    adjust-cursor-height =
    adjust-box-thickness =

    grapheme-width-method = unicode
    freetype-load-flags = hinting,force-autohint,monochrome,autohint

    theme = "catppuccin-mocha"
    background = #000000
    # foreground = #ffffff
    selection-foreground =
    selection-background =
    selection-invert-fg-bg = true
    minimum-contrast = 1
    cursor-color =
    cursor-invert-fg-bg = false
    cursor-opacity = 1
    cursor-style = block
    cursor-style-blink = false
    cursor-text =
    cursor-click-to-move = true
    mouse-hide-while-typing = false
    mouse-shift-capture = false
    mouse-scroll-multiplier = 1
    background-opacity = 0.8
    background-blur-radius = 0
    unfocused-split-opacity = 0.7
    unfocused-split-fill =

    command =
    initial-command =
    wait-after-command = false
    abnormal-command-exit-runtime = 250
    scrollback-limit = 10000000
    link-url = true
    fullscreen = false
    title =
    class =
    x11-instance-name =
    working-directory =

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
    window-padding-balance = false
    window-padding-color = background
    window-vsync = false
    window-inherit-working-directory = true
    window-inherit-font-size = true
    window-decoration = false
    window-title-font-family =
    window-theme = auto
    window-colorspace = srgb
    window-height = 0
    window-width = 0
    window-save-state = default
    window-step-resize = false
    window-new-tab-position = current
    resize-overlay = never
    resize-overlay-position = center
    resize-overlay-duration = 750ms
    focus-follows-mouse = false
    clipboard-read = allow
    clipboard-write = allow
    clipboard-trim-trailing-spaces = true
    clipboard-paste-protection = true
    clipboard-paste-bracketed-safe = true
    image-storage-limit = 320000000
    copy-on-select = true
    click-repeat-interval = 0
    config-file =
    confirm-close-surface = false
    quit-after-last-window-closed = true
    quit-after-last-window-closed-delay =
    initial-window = true

    shell-integration = zsh
    shell-integration-features = no-cursor,sudo,no-title
    osc-color-report-format = 16-bit
    vt-kam-allowed = false
    custom-shader =
    custom-shader-animation = true
    linux-cgroup = single-instance
    linux-cgroup-memory-limit =
    linux-cgroup-processes-limit =
    linux-cgroup-hard-fail = false
    gtk-single-instance = desktop
    gtk-titlebar = true
    gtk-tabs-location = top
    adw-toolbar-style = raised
    gtk-wide-tabs = true
    gtk-adwaita = true
    desktop-notifications = true
    bold-is-bright = false
    term = xterm-ghostty
    enquiry-response =
    auto-update = off
    auto-update-channel =
  '';
}
