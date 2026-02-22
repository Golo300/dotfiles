{ config, agenix, pkgs, ... }: {

  networking.firewall.allowedUDPPorts = [
    53
    51820
    12345
    12344
    12343
    12342
    12341
    12340
    56887
  ];

  networking.nat = {
    enable = true;
    enableIPv6 = true;
    externalInterface = "eth0";
    internalInterfaces = [ "wg0" ];
  };

  networking.hosts = {
    "192.168.178.34" = [ "pi" ];
    "192.168.178.33" = [ "center" "stream.center" "vikunja.center" "dashboard.center" "solar.center" "paperless.center" "meetube.center" "portainer.center" "habits.center" ];
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = [ "192.168.178.201/24" ];
      listenPort = 56887; # to match firewall allowedUDPPorts (without this wg uses random port numbers)
      dns = [ "8.8.8.8" ];

      privateKeyFile = config.age.secrets.wireguardPrivateKey.path;

      peers = [
        {
          publicKey = "ZanxcfJyP1hwSKVvY3JI1ZvcMC5OMxVLoas8rLGsmW0=";

          presharedKeyFile = config.age.secrets.wireguardPresharedKey.path;

          # Forward all the traffic via VPN.
          allowedIPs = [
            "0.0.0.0/0"
            "192.168.178.0/24"
          ];
          endpoint = "3w5ors5aoi76vh65.myfritz.net:56887";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
