{
  pkgs,
  lib,
  ...
}: {
  services.swaync = {
    enable = true;
    settings = {
      "positionX" = "right";
      "positionY" = "top";
      "layer" = "overlay";
      "control-center-layer" = "top";
      "layer-shell" = true;
      "cssPriority" = "application";

      "control-center-width" = 400;
      "control-center-margin-top" = 5;
      "control-center-margin-bottom" = 5;
      "control-center-margin-right" = 5;
      "control-center-margin-left" = 0;

      "notification-2fa-action" = true;
      "notification-inline-replies" = false;
      "notification-window-width" = 400;
      "notification-icon-size" = 80;
      "notification-body-image-height" = 180;
      "notification-body-image-width" = 180;
      "timeout" = 7;
      "timeout-low" = 5;
      "timeout-critical" = 10;
      "fit-to-screen" = true;
      "keyboard-shortcuts" = true;
      "image-visibility" = "when-available";
      "transition-time" = 200;
      "hide-on-clear" = false;
      "hide-on-action" = true;
      "script-fail-notify" = true;

      "widgets" = [
        "mpris"
        "title"
        "dnd"
        "notifications"
        "volume"
        "backlight"
      ];

      "widget-config" = {
        "mpris" = {
          "image-size" = 80;
          "image-radius" = 10;
        };
        "title" = {
          "text" = "Notification Center";
          "clear-all-button" = true;
          "button-text" = "󰆴";
        };
        "volume" = {
          "label" = "󰕾 ";
        };
        "backlight" = {
          "label" = "󰃟 ";
        };
      };
    };

    style =
      # css
      ''
        /* Catppuccin Mocha colors */
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

        @define-color background rgba(0, 0, 0, 0.8);
        @define-color background-light rgba(0, 0, 0, 0.6);

        * {
          all: unset;
          outline: none;
          font-family: 'JetBrainsMonoNL Nerd Font';
          color: @text;
          /* background: transparent; */
        }

        .control-center {
          background: @background-light;
          background-color: @background-light;
          border-radius: 8px;
        }

        /* .notification-row { */
        /*   /* background: @background-light; */ */
        /*   /* border-radius: 8px; */ */
        /* } */

        /* .notification { */
        /*   background: */
        /* } */
      '';
  };

  systemd.user.services.swaync = lib.mkForce {}; # Disable swaync systemd service

  home.packages = [pkgs.libnotify];
}
