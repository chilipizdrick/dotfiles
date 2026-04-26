{...}: {
  imports = [
    ./nushell
    ./fish
  ];

  home.shell = {
    enableNushellIntegration = true;
    enableFishIntegration = true;
  };
}
