{ config, agenix, pkgs, ... }: {

  networking.firewall.allowedUDPPorts = [
    51820
    12345
    12344
    12343
    12342
    12341
    12340
  ];
  networking.hosts = {
    "192.168.178.34" = [ "pi" ];
    "192.168.178.33" = [ "center" "nextcloud.center"];
  };

  #environment.etc."resolv.conf".text = "nameserver 192.168.178.1\nnameserver 9.9.9.9";

  networking.wg-quick.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      autostart = false;
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      address = [ "192.168.178.201/24" ];
      listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)
      dns = [ "8.8.8.8" ];

      privateKeyFile = config.age.secrets.wireguardPrivateKey.path;

      peers = [
        # For a client configuration, one peer entry for the server will suffice.
        {
          # Public key of the server (not a file path).
          publicKey = "3GHi7QPXFLQeTJuLsYgtOGDcjd68pc8YXj13fGVFCUg=";

          presharedKeyFile = config.age.secrets.wireguardPresharedKey.path;

          # Forward all the traffic via VPN.
          allowedIPs = [
            "0.0.0.0/0"
            "192.168.179.0/24"
          ];
          # Or forward only particular subnets
          #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

          # Set this to the server IP and port.
          #endpoint = "awajhg727oakmj5o.myfritz.net:56706";
          endpoint = "homebasetl.duckdns.org:56706";
          # ToDo: route to endpoint not automatically configured #
          # https://wiki.archlinux.org/index.php/WireGuard#Loop_routing 
          # https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
