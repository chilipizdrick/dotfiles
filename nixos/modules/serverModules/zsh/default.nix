{...}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
      histSize = 1000;
      shellAliases = {
        ll = "ls -la";
        l = "ls -la";
        lla = "ls -lah";
      };
    };
  };
}
