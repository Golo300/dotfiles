{ config, inputs, pkgs, agenix, lib, ... }:
{

  imports =
    [
      ./locale.nix
      ./nix.nix
      ./boot.nix
    ];

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;


  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };

  nix.settings.extra-platforms = config.boot.binfmt.emulatedSystems;

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

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };

  hardware.pulseaudio.enable = true;
  services.pipewire.enable = false;
  # basic packages for all systems
  environment.systemPackages = with pkgs; [
    vim
    git
    docker-compose
    rclone
    restic
    fuse
    ntfs3g
    vulkan-tools
    libva
    libva-utils
    agenix
    inputs.git-cloner.packages.${system}.default
  ];
  services.printing.enable = true;

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
}
