{...}: {
  programs.vicinae = {
    enable = true;

    themes.catppuccin-mocha-modified = {
      meta = {
        version = 1;
        name = "Catppuccin Mocha (Modified)";
        description = "Modified version of catppuccin mocha theme";
        variant = "dark";
      };

      colors = {
        core = {
          background = {
            name = "#000000";
            opacity = 0.8;
          };
          foreground = "#cdd6f4";
          secondary_background = {
            name = "#181825";
            opacity = 1;
          };
          border = "#313244";
          accent = "#89b4fa";
        };
        accents = {
          blue = "#89b4fa";
          green = "#a6e3a1";
          magenta = "#f5c2e7";
          orange = "#fab387";
          purple = "#cba6f7";
          red = "#f38ba8";
          yellow = "#f9e2af";
          cyan = "#94e2d5";
        };
        list.item = {
          selection = {
            background = {
              name = "#313244";
              opacity = 0.5;
            };
            secondary_background = {
              name = "#383a4a";
              opacity = 0.5;
            };
          };
          hover = {
            background = {
              name = "#262637";
              opacity = 0.5;
            };
          };
        };
      };
    };

    settings = {
      close_on_focus_loss = true;
      theme.dark.name = "catppuccin-mocha-modified";
      launcher_window.opacity = 0.8;
    };

    systemd.enable = true;
  };

  # home.packages = with pkgs; [
  #   vicinae
  # ];
  #
  # systemd.user.services.vicinae = {
  #   Unit.Description = "Vicinae server service.";
  #   Install.WantedBy = ["default.target"];
  #   Service = {
  #     Restart = "always";
  #     RestartSec = 5;
  #     ExecStart = "${pkgs.vicinae}/bin/vicinae server";
  #   };
  # };

  # home.file.".local/share/vicinae/themes/catppuccin-mocha-modified.toml".source = ./catppuccin-mocha-modified.toml;
}
