{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        show_hidden = true;
      };
      # preivew = {
      #   ueberzug_scale = 0.6;
      #   ueberzug_offset = "[0.6, 0.6, 0, 0]";
      # };
    };
    package = pkgs.yazi;
  };
  home.packages = with pkgs; [
    ueberzugpp
  ];
}
