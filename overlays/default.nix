{...}: {
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    rofi-wayland = prev.rofi-wayland.override {
      plugins = [
        (prev.rofi-calc.override {
          rofi-unwrapped = prev.rofi-wayland-unwrapped;
        })
      ];
    };
  };

  scripts = final: _prev: {
    scripts = import ../pkgs/scripts final.pkgs;
  };
}
