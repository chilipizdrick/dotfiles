{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nautilus
  ];

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };
}
