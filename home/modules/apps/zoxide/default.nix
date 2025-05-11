{...}: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
