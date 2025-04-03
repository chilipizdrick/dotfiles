{...}: {
  home.file.".config/wlogout/style.css".text =
    # css
    ''
      @import url("themes/catppuccin-mocha.css");

      window {
        font-family: JetBrains Mono;
        font-size: 18pt;
        color: @rosewater;
        background-color: rgba(0, 0, 0, 0.5);
      }

      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        background-color: transparent;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s ease-in;
        box-shadow: 0 0 10px 2px transparent;
        border-radius: 36px;
        margin: 10px;
      }

      button:focus {
        box-shadow: none;
        background-size: 20%;
      }

      button:hover {
        background-size: 50%;
        box-shadow: 0 0 10px 3px rgba(0, 0, 0, .4);
        background-color: @rosewater;
        color: transparent;
        transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
      }

      #shutdown {
        background-image: image(url("./icons/power.png"));
      }

      #shutdown:hover {
        background-image: image(url("./icons/power-hover.png"));
        color: @base;
      }

      #logout {
        background-image: image(url("./icons/logout.png"));
      }

      #logout:hover {
        background-image: image(url("./icons/logout-hover.png"));
        color: @base;
      }

      #reboot {
        background-image: image(url("./icons/restart.png"));
      }

      #reboot:hover {
        background-image: image(url("./icons/restart-hover.png"));
        color: @base;
      }

      #lock {
        background-image: image(url("./icons/lock.png"));
      }

      #lock:hover {
        background-image: image(url("./icons/lock-hover.png"));
        color: @base;
      }

      #hibernate {
        background-image: image(url("./icons/hibernate.png"));
      }

      #hibernate:hover {
        background-image: image(url("./icons/hibernate-hover.png"));
        color: @base;
      }
    '';
  home.file.".config/wlogout/themes/catppuccin-mocha.css".text =
    # css
    ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;
    '';
}
