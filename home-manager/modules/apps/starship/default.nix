{lib, ...}: {
  programs.starship = let
    elemsConcatted = builtins.concatStrings (
      map (s: "\$${s}") [
        "hostname"
        "username"
        "directory"
        "shell"
        "nix_shell"
        "git_branch"
        "git_commit"
        "git_state"
        "git_status"
        "jobs"
        "cmd_duration"
      ]
    );
  in {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$nix_shell"
        "\n"
        "$character"
      ];

      directory = {
        format = "[$path]($style) ";
        style = "blue";
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "grey";
      };

      git_status = {
        format = "[$modified$ahead_behind]($style) ";
        style = "grey";
        modified = "*";
        ahead = "⇡";
        behind = "⇣";
      };

      nix_shell = {
        symbol = "[󱄅 ](cyan)";
        format = "[$symbol$name]($style) ";
        style = "blue";
      };

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
    };

    #   settings = {
    #     scan_timeout = 2;
    #     command_timeout = 2000;
    #     add_newline = false;
    #     line_break.disabled = false;
    #
    #     format = " ${elemsConcatted}\n$character";
    #
    #
    #     # configure specific elements
    #     character = {
    #       error_symbol = "[](bold red)";
    #       #success_symbol = "[](bold green)";
    #       success_symbol = "[󰗢](bold green)";
    #       vicmd_symbol = "[](bold yellow)";
    #       format = " $symbol [|](bold bright-black) ";
    #     };
    #
    #
    #
    #     git_status = {
    #       style = "red";
    #       ahead = "⇡ ";
    #       behind = "⇣ ";
    #       conflicted = " ";
    #       renamed = "»";
    #       deleted = "✘ ";
    #       diverged = "⇆ ";
    #       modified = "!";
    #       stashed = "≡";
    #       staged = "+";
    #       untracked = "?";
    #     };
    #   };
  };
}
