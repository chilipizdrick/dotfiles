{...}: {
  home.file.".config/rofi/config.rasi".text = ''
    @theme "~/.config/rofi/themes/nova-dark.rasi"
  '';

  home.file.".config/rofi/themes/default.rasi".text = ''
    * {
        text-selected:               white;
        text:                        lightgray;

        shade-shadow:                white / 6%;
        shade-bg:                    white / 12%;
        shade-border:                white / 24%;
    }

    window {
        fullscreen:                  true;
        cursor:                      "default";
        background-color:            black / 50%;
        width:                       100%;
        height:                      100%;
        margin:                      0px;
        padding:                     0px;
        border-radius:               0px;
        border:                      0px;
    }

    element normal.normal,
    element alternate.normal {
        background-color:            transparent;
        text-color:                  lightgray;
    }

    element selected.normal {
        background-color:            white / 15%;
        text-color:                  white;
        border:                      0px solid;
        border-color:                lightgray;
    }

    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.5;
    }

    listview {
      border:                        0px;
    }

    scrollbar {
        margin:                      0px 4px;
        handle-width:                8px;
        handle-color:                white;
        background-color:            white / 15%;
        border-radius:               4px;
    }

    message {
        background-color:            white / 15%;
        border:                      0px solid;
        border-color:                transparent;
        border-radius:               12px;
        padding:                     24px;
    }

    error-message {
        padding:                     100px;
        border:                      0px solid;
        border-radius:               0px;
        background-color:            white / 15%;
        text-color:                  white;
    }

    textbox {
        background-color:            transparent;
        text-color:                  white;
        vertical-align:              0.5;
        horizontal-align:            0.5;
        highlight:                   none;
    }
  '';

  home.file.".config/rofi/themes/nova-dark.rasi".text = ''
    configuration {
        modi:                       "drun,calc";
        show-icons:                 true;
        display-calc:               " ";
        display-drun:               " ";
        drun-display-format:        "{name}";
        font:                        "JetBrains Mono Nerd Font 12";
    }

    @import "default.rasi"

    mainbox {

        children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
        background-color:            transparent;

        spacing:                     24px;
        margin:                      0px;
        padding:                     100px 226px;
    }

    inputbar {
        children:                    [ "prompt", "entry" ];

        border-radius:               12px;
        background-color:            black / 30%;
        text-color:                  white;

        spacing:                     12px;
        padding:                     14px;
    }

    prompt {
        background-color:            transparent;
        text-color:                  inherit;
    }

    textbox-prompt-colon {
        expand:                      false;
        str:                         "::";
        background-color:            transparent;
        text-color:                  inherit;
    }

    entry {
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        placeholder:                 " ";
        placeholder-color:           inherit;
    }

    listview {
        cursor:                      "default";
        columns:                     6;
        lines:                       4;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        background-color:            transparent;
        text-color:                  white;

        spacing:                     0px;
        margin:                      0px;
        padding:                     0px;
    }

    mode-switcher {
        background-color:            transparent;
        border:                      0px;

        margin: 0px;
        padding: 0px;
        spacing: 12px;
    }

    button {
        padding:                     12px 0px;
        border-radius:               12px;
        background-color:            black / 30%;
        text-color:                  white;
        cursor:                      pointer;
    }

    button selected {
        background-color:            white / 15%;
        border:                      0px solid;
        border-color:                white;
        text-color:                  white;
    }

    element {
        cursor:                      pointer;
        border-radius:               24px;
        background-color:            transparent;
        text-color:                  white;
        orientation:                 vertical;

        spacing:                     16px;
        margin:                      0px;
        padding:                     36px 0px;
    }

    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        72px;
        cursor:                      inherit;
    }
  '';
}
