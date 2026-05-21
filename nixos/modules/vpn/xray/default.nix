# {...}: {
#   services.xray = {
#     enable = true;
#
#     settings = {
#       log.loglevel = "warning";
#       inbounds = [
#         {
#           port = 0;
#           protocol = "tun";
#           tag = "tun-in";
#           settings = {
#             name = "xray-tun";
#             mtu = 1500;
#             autoRoute = true;
#             strictRoute = true;
#             endpointIndependentNat = true;
#           };
#           sniffing = {
#             enabled = true;
#             destOverride = ["http" "tls" "quic"];
#           };
#         }
#       ];
#       outbounds = [
#         {
#           protocol = "vless";
#           tag = "proxy";
#           settings = {
#             vnext = [
#               {
#                 address = "66.151.42.238";
#                 port = 443;
#                 users = [
#                   {
#                     id = "f8b1cd29-2aad-413f-912c-10bac1b6e6a3";
#                     encryption = "none";
#                     flow = "xtls-rprx-vision";
#                   }
#                 ];
#               }
#             ];
#           };
#           streamSettings = {
#             network = "tcp";
#             security = "reality";
#             realitySettings = {
#               fingerprint = "chrome";
#               serverName = "www.microsoft.com";
#               publicKey = "tfUCVSRSsWgbCF7Mn1up4AThYQOh1xxTGP9eJoPTByM";
#               shortId = "f4e31ca1";
#               spiderX = "/";
#             };
#           };
#         }
#         {
#           protocol = "freedom";
#           tag = "direct";
#         }
#       ];
#       routing = {
#         domainStrategy = "IPIfNonMatch";
#         rules = [
#           {
#             type = "field";
#             ip = [
#               "127.0.0.0/8"
#               "10.0.0.0/8"
#               "172.16.0.0/12"
#               "192.168.0.0/16"
#               "::1/128"
#               "fc00::/7"
#               "fe80::/10"
#             ];
#             outboundTag = "direct";
#           }
#         ];
#       };
#     };
#   };
# }
{pkgs, ...}: {
  services.xray = {
    enable = true;

    settingsFile = pkgs.writeText "xray-tun-config.json" (builtins.toJSON {
      log.loglevel = "warning";

      inbounds = [
        {
          port = 0;
          protocol = "tun";
          tag = "tun-in";
          settings = {
            name = "xray-tun";
            mtu = 1500;
            autoRoute = true;
            strictRoute = true;
            endpointIndependentNat = true;
          };
          sniffing = {
            # enabled = true;
            enabled = false;
            # destOverride = ["http" "tls" "quic"];
          };
        }
      ];

      outbounds = [
        {
          protocol = "vless";
          tag = "proxy";
          settings = {
            vnext = [
              {
                # address = "66.151.42.238"; # Replace with your VPS IP
                address = "chili.fin-tech.com";
                port = 443;
                users = [
                  {
                    id = "f8b1cd29-2aad-413f-912c-10bac1b6e6a3"; # Replace with your UUID
                    encryption = "none";
                    flow = "xtls-rprx-vision";
                  }
                ];
              }
            ];
          };
          streamSettings = {
            network = "tcp";
            security = "reality";
            realitySettings = {
              fingerprint = "chrome";
              serverName = "www.microsoft.com";
              publicKey = "tfUCVSRSsWgbCF7Mn1up4AThYQOh1xxTGP9eJoPTByM";
              shortId = "f4e31ca1";
              spiderX = "/";
            };
          };
        }
        {
          protocol = "freedom";
          tag = "direct";
        }
      ];

      routing = {
        domainStrategy = "IPIfNonMatch";
        rules = [
          {
            type = "field";
            ip = [
              "127.0.0.0/8"
              "10.0.0.0/8"
              "172.16.0.0/12"
              "192.168.0.0/16"
              "::1/128"
              "fc00::/7"
              "fe80::/10"
            ];
            outboundTag = "direct";
          }
        ];
      };
    });
  };
}
