{...}: {
  home.shellAliases = {
    ll = "ls -l";
    l = "ls -l";
    la = "ls -a";
    gadd = "git add .";
    # tmux is picky with teminal colors
    tmux = "TERM=tmux-256color tmux -u";
    tms = "TERM=tmux-256color tms";
  };
}
