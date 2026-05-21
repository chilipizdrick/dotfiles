{pkgs, ...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "alexa3mail@gmail.com";
        name = "Alexey Ershov";
      };
    };
  };

  home.packages = with pkgs; [
    jj-fzf
  ];
}
