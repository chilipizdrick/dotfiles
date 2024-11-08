{pkgs, ...}: {
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.policykit.exec" &&
            action.lookup("program") == "${pkgs.scripts.toggle-tailscale}/bin/toggle-tailscale") {
            return polkit.Result.YES;
        }
    });
  '';
}
