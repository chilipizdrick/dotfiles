{pkgs, ...}: {
  imports = [
    ./zsh
    ./nu
  ];

  users.defaultUserShell = pkgs.zsh;
}
