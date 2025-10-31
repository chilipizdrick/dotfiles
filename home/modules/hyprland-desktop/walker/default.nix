{inputs, ...}: {
  imports = [inputs.walker.homeManagerModules.default];

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      theme = "modified";
      providers.default = [
        "desktopapplications"
        "calc"
        "websearch"
      ];
    };
    themes = {
      modified = {
        style = builtins.readFile ./style.css;
        layouts = {
          item = builtins.readFile ./item.xml;
          item_archlinuxpkgs = builtins.readFile ./item_archlinuxpkgs.xml;
          item_calc = builtins.readFile ./item_calc.xml;
          item_clipboard = builtins.readFile ./item_clipboard.xml;
          item_dmenu = builtins.readFile ./item_dmenu.xml;
          item_files = builtins.readFile ./item_files.xml;
          item_providerlist = builtins.readFile ./item_providerlist.xml;
          item_symbols = builtins.readFile ./item_symbols.xml;
          item_todo = builtins.readFile ./item_todo.xml;
          item_unicode = builtins.readFile ./item_unicode.xml;
          keybind = builtins.readFile ./keybind.xml;
          layout = builtins.readFile ./layout.xml;
          preview = builtins.readFile ./preview.xml;
        };
      };
    };
  };
}
