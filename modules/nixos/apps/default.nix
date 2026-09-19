{pkgs, ...}: {
  programs.command-not-found.enable = false;

  environment.systemPackages = with pkgs; [
    # home-manager
    alejandra
    bat
    curl
    dust
    fd
    ffmpeg
    fzf
    gdu
    git
    gzip
    hyperfine
    imagemagick
    jq
    jujutsu
    microfetch
    neovim
    p7zip
    ripgrep
    socat
    sops
    tealdeer
    tmux
    tmux-sessionizer
    unzip
    wget
    zip
  ];
}
