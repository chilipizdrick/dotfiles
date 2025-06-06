{inputs', ...}: {
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.policykit.exec" &&
            action.lookup("program") == "${inputs'.scripts.packages.toggle-tailscale}/bin/toggle-tailscale") {
            return polkit.Result.YES;
        }
    });
  '';
}
