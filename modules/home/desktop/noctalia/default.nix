{lib, ...}: {
  programs.noctalia = {
    enable = true;
    settings = fromTOML (builtins.readFile ./config.toml);
    systemd.enable = true;
  };

  home.activation.setupKdeGlobals = lib.hm.dag.entryAfter ["writeBoundary"] ''
    KDEGLOBALS="$HOME/.config/kdeglobals"
    if [ ! -f "$KDEGLOBALS" ]; then
      mkdir -p "$HOME/.config"
      cat > "$KDEGLOBALS" << 'EOF'
    [General]
    ColorScheme=noctalia
    Name=noctalia
    shadeSortColumn=true
    TerminalApplication=alacritty
    TerminalService=Alacritty.desktop

    [KDE]
    colorScheme=noctalia
    widgetStyle=Breeze
    contrast=4

    [Icons]
    Theme=breeze-dark
    EOF
    fi
  '';
}
