{
  writeShellScriptBin,
  pipewire,
  gnugrep,
  ...
}:
writeShellScriptBin "clever-hijacker" ''
  set -e

  if ${pipewire}/bin/pw-dump | ${gnugrep}/bin/grep $1 > /dev/null; then
    hijacker2 -a $1 $2
  else
    hijacker2 $2
  fi
''
