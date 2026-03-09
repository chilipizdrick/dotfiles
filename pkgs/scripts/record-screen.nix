{
  writeShellScriptBin,
  wf-recorder,
  libnotify,
  ...
}:
writeShellScriptBin "record-screen" ''

  pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && ${libnotify}/bin/notify-send "📷 Saved recording to $HOME/Videos" && exit 0

  dateTime=$(date +%m-%d-%Y-%H:%M:%S)
  ${libnotify}/bin/notify-send "📷 Starting screen recording"
  ${wf-recorder}/bin/wf-recorder --bframes max_b_frames -f $HOME/Videos/$dateTime.mp4
''
