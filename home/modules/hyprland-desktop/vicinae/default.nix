{pkgs, ...}: {
  home.packages = with pkgs; [
    vicinae
  ];

  systemd.user.services.vicinae = {
    Unit.Description = "Vicinae server service.";
    Install.WantedBy = ["default.target"];
    Service = {
      Restart = "always";
      RestartSec = 5;
      ExecStart = "${pkgs.vicinae}/bin/vicinae server";
    };
  };

  xdg.configFile."vicinae/vicinae.json" = {
    source = ./vicinae.json;
    force = true;
  };
  home.file.".local/share/vicinae/themes/catppuccin-mocha-modified.toml".source = ./catppuccin-mocha-modified.toml;
}
