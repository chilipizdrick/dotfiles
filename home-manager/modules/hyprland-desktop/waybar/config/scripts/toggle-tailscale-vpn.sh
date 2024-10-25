#!/usr/bin/env sh

if [[ "$(tailscale status)" == "Tailscale is stopped." ]]; then
    tailscale up
else
    tailscale down
fi
