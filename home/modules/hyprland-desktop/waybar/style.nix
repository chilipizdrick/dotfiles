{...}: {
  home.file.".config/waybar/style.css".text =
    #css
    ''
      @import url("catppuccin-mocha.css");

      @define-color background rgba(0, 0, 0, 0.8);
      @define-color hover rgba(255, 255, 255, 0.2);
      @define-color hover-urgent rgba(249, 205, 178, 0.5);

      * {
        all: initial; min-height: 0; font-family: monospace;
        font-size: 12px;
        font-weight: bold;
        /* color: @white; */
        color: @text;
        border-radius: 8px 8px 8px 8px;
      }

      .modules-left {
        background: @background;
      }
      .modules-right {
        background: @background;
      }
      .modules-center {
        background: @background;
      }

      tooltip, menu {
        background: @background;
        padding: 3px;
      }

      menu label {
        padding: 3px;
      }

      tooltip label {
        padding: 0px;
      }

      menu menuitem:hover{
        background: @hover;
      }

      #custom-launcher,
      #cava,
      #workspaces,
      #mpris,
      #clock,
      #tray,
      #backlight,
      #pulseaudio,
      #custom-vpn,
      #network,
      #cpu,
      #battery,
      #custom-powermenu {
        background-color: transparent;
        margin-top: 0px;
        margin-bottom: 0px;
        margin-left: 5px;
        margin-right: 5px;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
      }


      #custom-launcher {
        margin-left: 0px;
        padding-left: 8px;
        padding-right: 13px;
      }

      #custom-launcher:hover {
        background: @hover;
        color: @blue;
      }


      #workspaces {
        padding: 0px;
        margin-left: 5px;
        margin-right: 0px;
        padding-left: 0px;
        padding-right: 0px;
      }

      #workspaces button {
        margin-left: 0px;
        margin-right: 0px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 5px;
        padding-bottom: 5px;
        background: transparent;
      }

      #workspaces button.focused label {
        color: @blue;
      }

      #workspaces button.active label {
        color: @blue;
      }

      #workspaces button.urgent {
        background: @peach;
      }

      #workspaces button.urgent label {
        color: black;
      }

      #workspaces button:hover {
        background: @hover;
      }

      #workspaces button.urgent:hover {
        background: @hover-urgent;
      }

      #mpris {
        padding-left: 8px;
        padding-right: 5px;
        margin-left: 10px;
        margin-right: 0px;
      }

      #mpris:hover {
        background: @hover;
      }

      #cava {
        padding-left: 0px;
        padding-right: 0px;
        margin-left: 10px;
        margin-right: 10px;
      }

      #pulseaudio.bluetooth {
        color: @blue;
      }

      #pulseaudio.muted {
        color: @red;
      }

      #pulseaudio:hover {
        background: @hover;
      }


      #custom-vpn.on {
        color: @green;
      }

      #custom-vpn.off {
        color: @red;
      }

      #custom-vpn:hover {
        background: @hover;
      }


      #network.disconnected {
        color: @red;
      }

      #network:hover {
        /* background: @hover; */
      }


      #battery {
        color: @green;
      }

      #battery.full {
        color: @green;
      }

      #battery.plugged {
        color: @blue;
      }

      #battery.charging {
        color: @blue;
      }

      #battery.warning {
        color: @yellow;
      }

      #battery.critical {
        color: @peach;
      }

      #battery.critical:not(.charging) {
        color: @red;
      }

      #custom-powermenu {
        margin-right: 0px;
        padding-left: 9px;
        padding-right: 12px;
      }

      #custom-powermenu:hover {
        background: @hover;
        color: @red;
      }
    '';

  home.file.".config/waybar/catppuccin-mocha.css".text =
    # css
    ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;
    '';
}
