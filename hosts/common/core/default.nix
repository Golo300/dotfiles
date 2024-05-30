{ config, inputs, pkgs, agenix, ... }:
{

  imports =
    [
      ./locale.nix
      ./nix.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  networking.networkmanager.ensureProfiles.profiles = {
    "GPN" = {
      connection = {
        id = "GPN";
        type = "wifi";
        autoconnect = true;
        interface-name = "wlp1s0";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "GPN";
      };
      wifi-security = {
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        eap = "ttls;";
        identity = "gpn";
        password = "gpn";
        phase2-auth = "pap";
        domain-suffix-match = "radius.noc.gulas.ch";
        ca-cert = "${builtins.fetchurl {
            url = "https://letsencrypt.org/certs/isrgrootx1.pem";
            sha256 = "sha256:1la36n2f31j9s03v847ig6ny9lr875q3g7smnq33dcsmf2i5gd92";
            }}";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };

  hardware.pulseaudio.enable = true;

  # basic packages for all systems
  environment.systemPackages = with pkgs; [
    vim
    git
    docker-compose
    rclone
    restic
    agenix
  ];
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
}
