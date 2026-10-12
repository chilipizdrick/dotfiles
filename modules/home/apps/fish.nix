{
  programs.fish = {
    enable = true;
    shellInit = ''
      set fish_greeting
      bind " " expand-abbr or self-insert
      export NIXPKGS_ALLOW_UNFREE=1

      function fish_prompt
        set -l last_status $status
        set_color -o blue
        printf '%s\n' (prompt_pwd)
        if test $last_status -eq 0
            set_color -o green
        else
            set_color -o red
        end
        printf '❯ '
        set_color normal
      end

      abbr -a nsn --set-cursor "nix shell nixpkgs#% -c fish"
    '';
  };

  home.shell.enableFishIntegration = true;
}
