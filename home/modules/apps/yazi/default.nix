{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = {
      manager = {
        show_hidden = false;
      };
      preview = {
        max_height = 600;
        max_width = 600;
      };
    };
    plugins = {
      filepicker = ./plugins/filepicker;
      compress = ./plugins/compress;
    };
    keymap = {
      manager.prepend_keymap = [
        {
          on = ["<C-p>"];
          run = "plugin filepicker";
          desc = "Open filepicker";
        }
        {
          on = ["c" "a"];
          run = "plugin compress";
          desc = "Compress file";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    ripdrag
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    resvg
    imagemagick
    wl-clipboard
  ];

  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
}
