{...}: {
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.policykit.exec" &&
            action.lookup("program") == "/home/alex/.config/waybar/scripts/toggle-tailscale-vpn.sh") {
            return polkit.Result.YES;
        }
    });
  '';
}
