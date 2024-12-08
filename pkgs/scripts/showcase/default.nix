{
  writeShellScriptBin,
  chafa,
  alacritty,
  pipes-rs,
  tty-clock,
  cava,
  asciiquarium-transparent,
  ...
}:
writeShellScriptBin "showcase" ''
  hyprctl dispatch movecursor 50 50
  sleep 0.1
  ${alacritty}/bin/alacritty -e sh -c "sleep 0.6 && ${asciiquarium-transparent}/bin/asciiquarium --transparent" &
  sleep 0.1
  # ${alacritty}/bin/alacritty -e sh -c "sleep 0.4 && ${cava}/bin/cava" &
  ${alacritty}/bin/alacritty -e sh -c "sleep 0.4 && cava" &
  sleep 0.1
  ${alacritty}/bin/alacritty -e sh -c "sleep 0.2 && ${pipes-rs}/bin/pipes-rs" &
  sleep 0.1
  ${alacritty}/bin/alacritty -e sh -c "sleep 0.3 && ${tty-clock}/bin/tty-clock" &
  sleep 0.1
  ${alacritty}/bin/alacritty -e sh -c "sleep 0.7 && ${chafa}/bin/chafa ${./dingus.gif}" &
''
