{pkgs, ...}: {
  programs.oh-my-posh = {
    enable = true;
    package = pkgs.unstable.oh-my-posh;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext
      /*
      json
      */
      ''
        {
          "console_title_template": "{{ .Shell }} in {{ .Folder }}",
          "final_space": true,
          "version": 2,
          "blocks": [
            {
              "alignment": "left",
              "newline": true,
              "type": "prompt",
              "segments": [
                {
                  "background": "transparent",
                  "foreground": "blue",
                  "style": "plain",
                  "template": "{{ .Path }}",
                  "type": "path",
                  "properties": {
                    "style": "full"
                  }
                },
                {
                  "background": "transparent",
                  "foreground": "p:grey",
                  "style": "plain",
                  "template": " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>",
                  "type": "git",
                  "properties": {
                    "branch_icon": "",
                    "commit_icon": "@",
                    "fetch_status": true
                  }
                }
              ]
            },
            {
              "overflow": "hidden",
              "type": "rprompt",
              "segments": [
                {
                  "background": "transparent",
                  "foreground": "yellow",
                  "style": "plain",
                  "template": "{{ .FormattedMs }}",
                  "type": "executiontime",
                  "properties": {
                    "threshold": 5000
                  }
                }
              ]
            },
            {
              "alignment": "left",
              "newline": true,
              "type": "prompt",
              "segments": [
                {
                  "background": "transparent",
                  "foreground_templates": [
                    "{{if gt .Code 0}}red{{end}}",
                    "{{if eq .Code 0}}magenta{{end}}"
                  ],
                  "style": "plain",
                  "template": "❯",
                  "type": "text"
                }
              ]
            }
          ],
          "secondary_prompt": {
            "background": "transparent",
            "foreground": "magenta",
            "template": "❯❯ "
          },
          "transient_prompt": {
            "background": "transparent",
            "foreground_templates": [
              "{{if gt .Code 0}}red{{end}}",
              "{{if eq .Code 0}}magenta{{end}}"
            ],
            "template": "❯ "
          }
        }
      '');
  };
}