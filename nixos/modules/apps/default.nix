{pkgs, ...}: {
  imports = [
    ./nautilus
    ./hyperion
  ];

  programs.command-not-found.enable = false;

  environment.systemPackages = with pkgs; [
    alejandra
    bat
    curl
    dust
    fd
    ffmpeg
    fzf
    git
    gzip
    home-manager
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
