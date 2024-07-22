{...}: {
  # Enable polkit
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    // Enable management of wireguard vpn for any user
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.systemd1.manage-units" &&
            action.lookup("unit") == "wg-quick-wg0.service") {
            return polkit.Result.YES;
        }
    });
  '';
}
