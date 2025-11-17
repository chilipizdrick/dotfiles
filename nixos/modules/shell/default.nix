{pkgs, ...}: {
  imports = [
    ./fish
  ];

  users.defaultUserShell = pkgs.fish;
}
