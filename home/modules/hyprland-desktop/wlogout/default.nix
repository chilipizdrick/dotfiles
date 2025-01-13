{...}: {
  imports = [
    ./config.nix
    ./style.nix
  ];

  programs.wlogout = {
    enable = true;
  };

  home.file.".config/wlogout/icons".source = ./assets/icons;
}
