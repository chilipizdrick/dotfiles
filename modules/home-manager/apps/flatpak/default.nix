{...}: {
  services.flatpak = {
    enable = true;
    packages = [
      "io.github.Soundux"
    ];
  };
}
