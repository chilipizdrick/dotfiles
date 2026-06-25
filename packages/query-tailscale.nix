{
  writeShellScriptBin,
  tailscale,
  ...
}:
writeShellScriptBin "query-tailscale" ''
  if [[ "$(${tailscale}/bin/tailscale status)" == "Tailscale is stopped." ]]; then
      echo "VPN (off)"
      echo "VPN (off)"
      echo "off"
  else
      echo "VPN (on)"
      echo "VPN (on)"
      echo "on"
  fi
''
