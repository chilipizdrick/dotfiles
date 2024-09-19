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

      # color = {
      #   gradient = 1;
      #   gradient_color_1 = "'#ff7070'";
      #   gradient_color_2 = "'#ffb870'";
      #   gradient_color_3 = "'#ffff70'";
      #   gradient_color_4 = "'#b8ff70'";
      #   gradient_color_5 = "'#70ff70'";
      #   gradient_color_6 = "'#70ffb8'";
      #   gradient_color_7 = "'#70ffff'";
      #   gradient_color_8 = "'#70b7ff'";
      # };
    };
  };
}
