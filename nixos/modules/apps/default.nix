{pkgs, ...}: {
  imports = [
    ./nautilus
    ./cli
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
