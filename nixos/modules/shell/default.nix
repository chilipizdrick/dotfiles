{pkgs, ...}: {
  imports = [
    ./zsh
    ./nu
    ./fish
  ];

  users.defaultUserShell = pkgs.fish;
}
