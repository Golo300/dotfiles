{ config, inputs, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../common/core
      ../common/custom

      # desktop config
      ../common/optional/desktop/hyperland.nix

      # users
      ../user/timl

      # module
      ../../modules
    ];

  services.blueman.enable = true;

  virtualisation.docker.enable = true;

  users.extraGroups.vboxusers.members = [ "timl" ];
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  services.flatpak.enable = true;

  hardware.opengl = {
    enable = true;
  };

  hardware.nvidia.open = false;

  environment.systemPackages = with pkgs; [
    heroic
    opentrack
    aitrack
    gamemode
    wine-wayland
    virtualglLib
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
    ollama-cuda
    claude-code
  ];

  programs.coolercontrol.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.steam.protontricks.enable = true;

    services.resolved = {
      enable = true;
      dnssec = "allow-downgrade";
    };

  environment.variables = {
    WINEARCH = "win64"; # Oder "win32" je nach Bedarf
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      icu
      openssl
      zlib
      libunwind
      lttng-ust
      krb5
      stdenv.cc.cc.lib
    ];
  };
  system.stateVersion = "25.05";
}
