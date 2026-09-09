{pkgs, ...}: let
  nsName = "ts-vpn";

  hostVeth = "ts-vpn-host";
  nsVeth = "ts-vpn-ns";

  hostIp = "10.200.200.1";
  nsIp = "10.200.200.2";
  subnet = "10.200.200.0/24";

  socketDir = "/run/tailscale-netns";
  stateDir = "/var/lib/tailscale-netns";

  # Privileged launcher.
  #
  # This binary starts setuid-root, enters exactly one network namespace,
  # permanently drops privileges back to the calling user, and then executes
  # the requested command.
  vpnLauncher = pkgs.stdenv.mkDerivation {
    pname = "vpn-launch";
    version = "1.0";

    dontUnpack = true;

    nativeBuildInputs = [pkgs.gcc];

    buildPhase = ''
      $CC \
        -O2 \
        -Wall \
        -Wextra \
        -Werror \
        -o vpn-launch \
        ${./vpn-launch.c}
    '';

    installPhase = ''
      install -Dm755 vpn-launch $out/bin/vpn-launch
    '';
  };

  # Unprivileged helper for controlling the Tailscale daemon.
  #
  # We deliberately do NOT make this setuid.
  #
  # Tailscale authentication/configuration is an administrative operation.
  tsVpnCli = pkgs.writeShellScriptBin "tailscale-vpn" ''
    set -euo pipefail

    exec ${pkgs.tailscale}/bin/tailscale \
      --socket=${socketDir}/tailscaled.sock \
      "$@"
  '';
in {
  # Prevent NetworkManager from probing or breaking the virtual interfaces.
  networking.networkmanager.unmanaged = [hostVeth nsVeth];

  # The host must route packets originating from the namespace.
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  # NAT traffic leaving the namespace.
  networking.nat = {
    enable = true;
    internalInterfaces = [hostVeth];
    internalIPs = [subnet];
  };

  # Namespace and Tailscale daemon.
  systemd.services.tailscale-netns = {
    description = "Tailscale network namespace";

    wantedBy = ["multi-user.target"];
    wants = ["network-online.target"];
    after = ["network-online.target"];

    path = [
      pkgs.iproute2
      pkgs.coreutils
      pkgs.tailscale
    ];

    preStart = ''
      set -euo pipefail

      # Isolate DNS for the namespace
      # This strictly prevents tailscaled from modifying the host's /etc/resolv.conf
      mkdir -p /etc/netns/${nsName}
      echo "nameserver 1.1.1.1" > /etc/netns/${nsName}/resolv.conf
      echo "nameserver 8.8.8.8" >> /etc/netns/${nsName}/resolv.conf

      # Remove leftovers from a previous crash.
      ${pkgs.iproute2}/bin/ip netns del ${nsName} 2>/dev/null || true
      ${pkgs.iproute2}/bin/ip link del ${hostVeth} 2>/dev/null || true

      # Create the network namespace.
      ${pkgs.iproute2}/bin/ip netns add ${nsName}

      # Bring up loopback.
      ${pkgs.iproute2}/bin/ip -n ${nsName} link set lo up

      # Create a dedicated veth pair.
      ${pkgs.iproute2}/bin/ip link add ${hostVeth} type veth peer name ${nsVeth}
      ${pkgs.iproute2}/bin/ip link set ${nsVeth} netns ${nsName}

      # Configure the host side.
      ${pkgs.iproute2}/bin/ip addr add ${hostIp}/24 dev ${hostVeth}
      ${pkgs.iproute2}/bin/ip link set ${hostVeth} up

      # Configure the namespace side.
      ${pkgs.iproute2}/bin/ip -n ${nsName} addr add ${nsIp}/24 dev ${nsVeth}
      ${pkgs.iproute2}/bin/ip -n ${nsName} link set ${nsVeth} up

      # Default route through the host.
      ${pkgs.iproute2}/bin/ip -n ${nsName} route replace default via ${hostIp}
    '';

    serviceConfig = {
      Type = "simple";

      # systemd creates these directories.
      RuntimeDirectory = "tailscale-netns";
      RuntimeDirectoryMode = "0755";

      StateDirectory = "tailscale-netns";
      StateDirectoryMode = "0700";

      ExecStart = ''
        ${pkgs.iproute2}/bin/ip \
          netns exec ${nsName} \
          ${pkgs.tailscale}/bin/tailscaled \
          --tun=tailscale0 \
          --socket=${socketDir}/tailscaled.sock \
          --state=${stateDir}/tailscaled.state
      '';

      ExecStopPost = ''
        ${pkgs.iproute2}/bin/ip netns del ${nsName} 2>/dev/null || true
        ${pkgs.iproute2}/bin/ip link del ${hostVeth} 2>/dev/null || true
      '';

      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  # Install the privileged launcher as a setuid-root wrapper.
  security.wrappers.vpn-launch = {
    source = "${vpnLauncher}/bin/vpn-launch";

    owner = "root";
    group = "root";

    permissions = "u+rx,g+rx,o+rx";

    setuid = true;
  };

  environment.systemPackages = [tsVpnCli];
}
