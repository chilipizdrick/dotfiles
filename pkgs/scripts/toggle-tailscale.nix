{
  writeShellScriptBin,
  tailscale,
  ...
}:
writeShellScriptBin "toggle-tailscale" ''
  if [[ "$(${tailscale}/bin/tailscale status)" == "Tailscale is stopped." ]]; then
      ${tailscale}/bin/tailscale up
  else
      ${tailscale}/bin/tailscale down
  fi
''
