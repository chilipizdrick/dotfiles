{lib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$nix_shell"
        "\n"
        "$character"
      ];

      right_format = lib.concatStrings [
        "$cmd_duration"
      ];

      directory = {
        format = "[$path](bold blue) ";
      };

      git_branch = {
        format = "[$branch](grey)";
      };

      git_status = {
        format = "[$modified](grey)[$ahead_behind](green) ";
        modified = "*";
        ahead = "⇡";
        behind = "⇣";
      };

      nix_shell = {
        symbol = "[󱄅 ](cyan)";
        format = "$symbol[$name](blue) ";
      };

      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[](yellow)";
        vimcmd_visual_symbol = "[](yellow)";
        vimcmd_replace_symbol = "[](yellow)";
        vimcmd_replace_one_symbol = "[](yellow)";
      };

      cmd_duration = {
        format = "[$duration](bold yellow)";
        min_time = 5000;
      };
    };
  };
}
