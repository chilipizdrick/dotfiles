{...}: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
        lower_cutoff_freq = 20;
        higher_cutoff_freq = 20000;
      };
      smoothing.noise_reduction = 50;
      smoothing.integral = 50;

      output = {
        channels = "mono";
        mono_option = "average";
        reverse = 0;
      };

      # Catppuccin color theme
      color = {
        gradient = 1;

        gradient_color_1 = "'#94e2d5'";
        gradient_color_2 = "'#89dceb'";
        gradient_color_3 = "'#74c7ec'";
        gradient_color_4 = "'#89b4fa'";
        gradient_color_5 = "'#cba6f7'";
        gradient_color_6 = "'#f5c2e7'";
        gradient_color_7 = "'#eba0ac'";
        gradient_color_8 = "'#f38ba8'";
      };
    };
  };
}
