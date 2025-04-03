{...}: {
  programs.git = {
    enable = true;
    userEmail = "alexa3mail@gmail.com";
    userName = "Alexey Ershov";
    extraConfig = {
      gpg.format = "ssh";
      user.signingkey = "/home/alex/.ssh/id_ed25519.pub";
    };
  };
}
