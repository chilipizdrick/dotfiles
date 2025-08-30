{pkgs, ...}: {
  imports = [
    # ./zsh
    # ./nushell
    ./fish
  ];

  users.defaultUserShell = pkgs.fish;
}
