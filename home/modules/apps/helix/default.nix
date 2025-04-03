{...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
        };
        file-picker = {
          hidden = false;
        };
      };
      keys.normal = {
        esc = ["collapse_selection" "keep_primary_selection"];
      };
    };
  };
}
