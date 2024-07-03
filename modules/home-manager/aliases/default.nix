{...}: {
  home.shellAliases = {
    ll = "ls -la";
    gadd = "git add .";
    gacp = ''
      gacp() {
        git add . && \
          git commit -m "anonimous commit" && \
          git push
      }
    '';
    # tmux is picky with teminal colors
    tmux = "TERM=tmux-256color tmux -u";
  };
}
