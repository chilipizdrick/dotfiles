{pkgs, ...}: {
  programs.command-not-found.enable = false;

  environment.systemPackages = [
    # pkgs.alejandra
    # pkgs.ffmpeg
    # pkgs.imagemagick
    # pkgs.microfetch
    pkgs._7zip-zstd
    pkgs.bat
    pkgs.curl
    pkgs.dust
    pkgs.fd
    pkgs.fzf
    pkgs.git
    pkgs.gzip
    pkgs.hyperfine
    pkgs.jq
    pkgs.jujutsu
    pkgs.neovim
    pkgs.ripgrep
    pkgs.socat
    pkgs.sops
    pkgs.tealdeer
    pkgs.tmux
    pkgs.tmux-sessionizer
    pkgs.unzip
    pkgs.wget
    pkgs.zip
  ];
}
