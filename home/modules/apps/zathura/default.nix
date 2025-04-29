{...}: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set selection-clipboard clipboard
      set recolor true
    '';
  };
}
