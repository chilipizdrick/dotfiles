{pkgs, ...} @ args: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
    settings = import ./config.nix args;
  };

  home.packages = with pkgs; [playerctl];
}
