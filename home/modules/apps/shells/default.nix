{...}: {
  imports = [
    # ./nushell
    ./fish
    # ./zsh
  ];

  home.shell = {
    # enableNushellIntegration = true;
    enableFishIntegration = true;
    # enableZshIntegration = true;
  };
}
