{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = with pkgs; [
      {
        name = zsh-fzf-tab.pname;
        src = zsh-fzf-tab.src;
      }
      {
        name = zsh-fzf-history-search.pname;
        src = zsh-fzf-history-search.src;
      }
      {
        name = zsh-completions.pname;
        src = zsh-completions.src;
      }
    ];
    initContent =
      # sh
      ''
        zstyle ':completion:*' completer _expand_alias _complete _ignored
      '';
  };
}
