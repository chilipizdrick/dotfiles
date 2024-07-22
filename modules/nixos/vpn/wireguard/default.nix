{...}: {
  networking.wg-quick.interfaces = let
    serverIp = "176.222.54.208";
    serverPublicKey = "Te685O0zvtKDCLPUFV06PrfFj/cgKRqLl9rCTmaL3W8=";
  in {
    wg0 = {
      autostart = false;
      # IP address of this machine in the *tunnel network*
      address = ["10.0.0.2/24" "fdc9:281f:04d7:9ee9::2/64"];
      # dns = [ "10.0.0.1" "fdc9:281f:04d7:9ee9::1" ];

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard.key";

      peers = [
        {
          publicKey = serverPublicKey;
          allowedIPs = ["0.0.0.0/0" "::/0"];
          endpoint = "${serverIp}:51820";
        }
      ];
    };
  };
}
