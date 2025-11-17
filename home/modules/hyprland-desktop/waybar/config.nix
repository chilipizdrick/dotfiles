{
  pkgs,
  scripts,
  ...
}: {
  mainBar = {
    reload_style_on_change = true;
    layer = "top";
    position = "top";
    margin-top = 5;
    margin-bottom = 0;
    margin-left = 5;
    margin-right = 5;
    height = 0;
    spacing = 2;

    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
      "mpris"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      "tray"
      "backlight"
      "wireplumber#sink"
      "wireplumber#source"
      "custom/tailscale"
      "memory"
      "cpu"
      "battery"
      "custom/powermenu"
    ];

    backlight = {
      format = "{icon} {percent}%";
      format-icons = ["" "" "" "" "" "" "" "" ""];
    };

    memory = {
      interval = 5;
      format = "  {percentage}%";
      tooltip-format = "Using {used:0.1f}G/{total:0.1f}G";
    };

    cpu = {
      interval = 5;
      format = "  {usage}%";
      max-length = 10;
    };

    tray = {
      spacing = 10;
      show-passive-items = true;
      icon-size = 16;
    };

    clock = {
      tooltip-format = "<tt>{calendar}</tt>";
      format = "{:%H:%M  %a %d %b}";
      locale = "ru_RU.UTF-8";
    };

    network = {
      format-wifi = "{icon}";
      format-disconnected = "󰤭  Disconnected";
      format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
      tooltip-format-disconnected = "Disconnected";
      tooltip-format-wifi = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
      format-ethernet = "{ifname}";
      tooltip-format-ethernet = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
      nospacing = 1;
      interval = 5;
      max-length = 20;
    };

    "wireplumber#sink" = {
      format = "{icon} {volume}%";
      format-muted = "󰝟";
      format-icons = ["󰕿" "󰖀" "󰕾"];
      max-volume = 200;
      on-click = "${pkgs.pwvucontrol}/bin/pwvucontrol";
      on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      scroll-step = 1;
    };

    "wireplumber#source" = {
      node-type = "Audio/Source";
      format = "󰍬 {volume}%";
      format-muted = "󰍭";
      max-volume = 200;
      on-click = "${pkgs.pwvucontrol}/bin/pwvucontrol";
      on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      scroll-step = 1;
    };

    "custom/launcher" = {
      format = "";
      tooltip = true;
      tooltip-format = "App Launcher";
      on-click = "${pkgs.vicinae}/bin/vicinae toggle";
    };

    battery = {
      format = "{icon} {capacity}%";
      format-icons = {
        charging = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
        default = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      };
      interval = 5;
      states = {
        warning = 30;
        critical = 15;
      };
      tooltip = true;
    };

    "custom/powermenu" = {
      format = "";
      tooltip = true;
      tooltip-format = "Power Menu";
      on-click = "${pkgs.wlogout}/bin/wlogout -b 4";
    };

    mpris = {
      format = "{player_icon} {dynamic}";
      format-paused = "{status_icon} {dynamic}";
      player-icons = {
        spotify = "";
        spotify_player = "";
        default = "";
      };
      dynamic-order = ["title" "artist"];
      dynamic-len = 50;
      interval = 1;
      status-icons = {
        paused = "";
      };
    };

    "custom/tailscale" = {
      exec = "${scripts.query-tailscale}/bin/query-tailscale";
      interval = 1;
      format = "VPN";
      on-click = "${scripts.toggle-tailscale}/bin/toggle-tailscale";
    };

    "custom/zapret" = {
      exec = "${scripts.query-zapret}/bin/query-zapret";
      interval = 1;
      format = "GOIDA";
      on-click = "${scripts.toggle-zapret}/bin/toggle-zapret";
    };
  };
}
