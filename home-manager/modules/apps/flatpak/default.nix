{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.Soundux"
    ];
  };
  # home.packages = with pkgs; [
  #   gnome.gnome-software
  # ];
}
