{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = pkgs.zsh-fzf-tab.pname;
        src = pkgs.zsh-fzf-tab.src;
      }
      {
        name = pkgs.zsh-fzf-history-search.pname;
        src = pkgs.zsh-fzf-history-search.src;
      }
      {
        name = pkgs.zsh-completions.pname;
        src = pkgs.zsh-completions.src;
      }
      # {
      #   name = pkgs.zsh-vi-mode.pname;
      #   src = pkgs.zsh-vi-mode.src;
      # }
    ];
    initExtra = ''
      zstyle ':completion:*' completer _expand_alias _complete _ignored
    '';
  };
}
