{pkgs, ...}: {
  imports = [
    ./nushell
    ./fish
  ];

  home.shell = {
    enableNushellIntegration = true;
    enableFishIntegration = true;
  };

  home.packages = with pkgs; [
    powershell
  ];
}
