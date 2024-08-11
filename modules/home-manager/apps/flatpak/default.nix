{pkgs, ...}: {
  services.flatpak = {
    enable = true;
    packages = [
      "io.github.Soundux"
    ];
  };
  # home.packages = with pkgs; [
  #   unstable.gnome.gnome-software
  # ];
}
