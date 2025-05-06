{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nushell = {
    enable = true;
    shellAliases = lib.mkForce (builtins.removeAttrs config.home.shellAliases ["nau" "nsn"]);

    extraEnv =
      # nu
      ''
        $env.EDITOR = "nvim"
        $env.TERMINAL = "ghostty"
        $env.BROWSER = "zen"
        $env.PROMPT_INDICATOR = ""
        $env.PROMPT_INDICATOR_VI_INSERT = ""
        $env.PROMPT_INDICATOR_VI_NORMAL = " "
        $env.PROMPT_MULTILINE_INDICATOR = ""
      '';

    extraConfig = let
      themeRepo = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "nushell";
        rev = "82c31124b39294c722f5853cf94edc01ad5ddf34";
        sha256 = "sha256-O95OrdF9UA5xid1UlXzqrgZqw3fBpTChUDmyExmD2i4=";
      };
    in
      # nu
      ''
        source ${themeRepo}/themes/catppuccin_mocha.nu

        let abbreviations = {
          nsn: "nix shell nixpkgs#"
          nau: '$env.NIXPKGS_ALLOW_UNFREE = "1"'
        }

        $env.config = {
          show_banner: false,
          edit_mode: vi,
          cursor_shape: {
            vi_insert: line,
            vi_normal: block,
          },
          keybindings: [
            {
              name: abbr_menu
              modifier: none
              keycode: enter
              mode: [emacs, vi_normal, vi_insert]
              event: [
                { send: menu name: abbr_menu }
                { send: enter }
              ]
            }
            {
              name: abbr_menu
              modifier: none
              keycode: space
              mode: [emacs, vi_normal, vi_insert]
              event: [
                { send: menu name: abbr_menu }
                { edit: insertchar value: " "}
              ]
            }
          ]

          menus: [
            {
              name: abbr_menu
              only_buffer_difference: false
              marker: none
              type: {
                layout: columnar
                columns: 1
                col_width: 20
                col_padding: 2
              }
              style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
              }
              source: { |buffer, position|
                let match = $abbreviations | columns | where $it == $buffer
                if ($match | is-empty) {
                  { value: $buffer }
                } else {
                  { value: ($abbreviations | get $match.0) }
                }
              }
            }
          ]
        }
      '';
  };
}
