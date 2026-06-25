{
  writeShellScriptBin,
  satty,
  slurp,
  grim,
  coreutils,
  wl-clipboard,
  ...
}:
writeShellScriptBin "satty-screenshot" ''
  set -e

  SCREENSHOT_DIR=~/Pictures/screenshots

  ${coreutils}/bin/mkdir -p "$SCREENSHOT_DIR"
  ${grim}/bin/grim -g "$(${slurp}/bin/slurp)" - | ${satty}/bin/satty -f - \
    -o "$SCREENSHOT_DIR/screenshot-$(${coreutils}/bin/date +'%Y-%m-%d_%H-%M-%S').png" \
    --early-exit \
    --save-after-copy \
    --actions-on-enter save-to-clipboard \
    --copy-command '${wl-clipboard}/bin/wl-copy' \
    --initial-tool brush \
    --no-window-decoration
''
