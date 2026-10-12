{pkgs, ...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "alexa3mail@gmail.com";
        name = "Alexey Ershov";
      };
      ui.default-command = "log";
    };
  };

  home.packages = [pkgs.jj-fzf];
}
