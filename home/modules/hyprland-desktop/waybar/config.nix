{
  pkgs,
  scripts,
  ...
}: {
  home.file.".config/waybar/config".text =
    # json
    ''
      {
        "reload_style_on_change": true,
        "layer": "top",
        "position": "top",
        "margin-top": 5,
        "margin-bottom": 0,
        "margin-left": 5,
        "margin-right": 5,
        "height": 0,
        "spacing": 0,
        "modules-left": [
          "custom/launcher",
          "hyprland/workspaces",
          "mpris"
          // "cava"
        ],
        "modules-center": [
          "clock"
        ],
        "modules-right": [
          "tray",
          "backlight",
          "pulseaudio",
          "custom/vpn",
          "network",
          "cpu",
          "battery",
          "custom/powermenu"
        ],
        "cava": {
          "method": "pipewire",
          "stereo": false,
          "framerate": 30,
          "bars": 10,
          "bar_delimiter": 0,
          "lower_cutoff_freq": 20,
          "hide_on_silence": false,
          "noise_reduction": 0.5,
          "input_delay": 0,
          "sensitivity": 2,
          "autosens": 1,
          "format-icons" : ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" ]
        },
        "wlr/taskbar": {
          "format": "{icon}",
          "icon-size": 25,
          "icon-theme": "Default",
          "tooltip-format": "{title}",
          "on-click": "activate",
          "on-click-middle": "close",
          "ignore-list": [
            "Alacritty"
          ]
        },
        "backlight": {
          "format": "{icon} {percent}%",
          "format-icons": ["", "", "", "", "", "", "", "", ""]
        },
        "memory": {
          "interval": 5,
          "format": "   {usage}% ",
          "max-length": 10
        },
        "cpu": {
          "interval": 5,
          "format": "   {usage}% ",
          "max-length": 10
        },
        "tray": {
          "spacing": 10,
          "show-passive-items": true
        },
        "clock": {
          "tooltip-format": "<tt>{calendar}</tt>",
          "format": "{:%H:%M  %a %d %b}",
        },
        "network": {
          "format-wifi": "{icon} {essid}",
          "format-disconnected": "Disconnected ⚠ ",
          "format-icons": [
            "󰤯 ",
            "󰤟 ",
            "󰤢 ",
            "󰤥 ",
            "󰤨 "
          ],
          "tooltip-format-disconnected": "Disconnected",
          "tooltip-format-wifi": "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}",
          "format-ethernet": "{ifname}", "tooltip-format-ethernet": "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}",
          "nospacing": 1,
          "interval": 5
        },
        "pulseaudio": {
          "format": "{icon}{volume}%",
          "format-bluetooth": "󰂰 {volume}%",
          "nospacing": 1,
          "tooltip-format": "Volume : {volume}%",
          "format-muted": "󰝟 ",
          "format-icons": {
            "headphone": " ",
            "default": [
              "󰕿 ",
              "󰖀 ",
              "󰕾 "
            ]
          },
          "on-click": "${pkgs.pavucontrol}/bin/pavucontrol",
          "scroll-step": 1
        },
        "custom/launcher": {
          "format": "",
          "tooltip": true,
          "tooltip-format": "App Launcher",
          "on-click": "${pkgs.rofi-wayland}/bin/rofi -show drun -modes drun"
        },
        "battery": {
          "format": "{icon} {capacity}%",
          "format-icons": {
            "charging": [
              "󰢜",
              "󰂆",
              "󰂇",
              "󰂈",
              "󰢝",
              "󰂉",
              "󰢞",
              "󰂊",
              "󰂋",
              "󰂅"
            ],
            "default": [
              "󰁺",
              "󰁻",
              "󰁼",
              "󰁽",
              "󰁾",
              "󰁿",
              "󰂀",
              "󰂁",
              "󰂂",
              "󰁹"
            ]
          },
          "interval": 5,
          "states": {
            "warning": 30,
            "critical": 15
          },
          "tooltip": true
        },
        "custom/powermenu": {
          "format": "⏻",
          "tooltip": true,
          "tooltip-format": "Power Menu",
          "on-click": "${pkgs.wlogout}/bin/wlogout -b 4"
        },
        "mpris": {
          "format": "{player_icon} {dynamic}",
          "format-paused": "{status_icon} {dynamic}",
          "player-icons": {
            "spotify": " ",
            "default": "▶"
          },
          "dynamic-order": ["title", "artist"],
          "dynamic-len": 50,
          "interval": 1,
          "status-icons": {
            "paused": "||"
          },
          "ignored-players": [ "firefox", "chromium", "brave", "zen" ]
        },
        "custom/vpn": {
          "exec": "${scripts.query-tailscale}/bin/query-tailscale",
          "interval": 1,
          "format": "VPN",
          "on-click": "pkexec ${scripts.toggle-tailscale}/bin/toggle-tailscale",
        }
      }
    '';
}
