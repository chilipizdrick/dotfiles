# Original script is taken from here https://gist.github.com/CapMousse/454ec041880e78b4e3a894e7a4033faa
{
  libnotify,
  hyprshot,
  imagemagick,
  tesseract,
  wl-clipboard,
  writeShellScriptBin,
  ...
}:
writeShellScriptBin "ocr" ''
  cleanup() {
    [[ -n $1 ]] && rm -r "$1"
  }

  image_dir=$(mktemp -d) || die "failed to create tmpdir"

  trap "cleanup '$image_dir'" EXIT

  ${hyprshot}/bin/hyprshot -m region -f image.png --silent -o $image_dir
  sleep 0.1
  ${imagemagick}/bin/mogrify -modulate 100,0 -resize 400% "$image_dir/image.png"
  ${tesseract}/bin/tesseract -l eng+rus "$image_dir/image.png" "$image_dir/text" &>/dev/null
  ${wl-clipboard}/bin/wl-copy <"$image_dir/text.txt"
  ${libnotify}/bin/notify-send "Extracted text into clipboard"

  exit 0
''
