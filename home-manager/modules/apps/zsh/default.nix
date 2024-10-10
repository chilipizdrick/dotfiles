{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = pkgs.zsh-fzf-history-search.pname;
        src = pkgs.zsh-fzf-history-search.src;
      }
    ];
  };
}
