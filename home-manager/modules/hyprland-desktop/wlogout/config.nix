{...}: {
  home.file.".config/wlogout/layout".text = ''
    {
        "label" : "shutdown",
        "action" : "systemctl poweroff",
        "text" : "[S]hutdown",
        "keybind" : "s"
    }
    {
        "label" : "reboot",
        "action" : "systemctl reboot",
        "text" : "[R]eboot",
        "keybind" : "r"
    }
    {
        "label" : "logout",
        "action" : "hyprctl dispatch exit",
        "text" : "Lo[g]out",
        "keybind" : "g"
    }
    {
        "label" : "lock",
        "action" : "hyprlock",
        "text" : "[L]ock",
        "keybind" : "l"
    }
  '';
}
