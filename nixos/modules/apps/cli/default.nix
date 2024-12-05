{pkgs, ...}: {
environment.systemPackages = with pkgs; [
    ripgrep
    wget
    curl
    jq
    git
    zip
    unzip
    gzip
    neovim
    fzf

    tmux
    tmux-sessionizer
    btop
    fastfetch
    alejandra

    sops
    tealdeer
    imagemagick
    ffmpeg
  ];
}
