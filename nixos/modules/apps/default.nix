{pkgs, ...}: {
  imports = [
    ./disable-command-not-found
    ./nautilus
    ./wireshark
  ];

  environment.systemPackages = with pkgs; [
    alejandra
    bat
    curl
    fd
    ffmpeg
    fzf
    git
    gzip
    home-manager
    imagemagick
    jq
    jujutsu
    microfetch
    neovim
    onlyoffice-desktopeditors
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
    hyperfine
  ];
}
