{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nautilus
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };
}
