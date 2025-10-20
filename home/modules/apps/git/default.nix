{config, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "alexa3mail@gmail.com";
        name = "Alexey Ershov";
      };
      gpg.format = "ssh";
      user.signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
    };
  };
}
