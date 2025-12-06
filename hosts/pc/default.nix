# main file for pc
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

  hardware.nvidia.open = false;

  environment.systemPackages = with pkgs; [
    lutris
    heroic
    gamemode
    wine-wayland
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  environment.variables = {
    WINEARCH = "win64"; # Oder "win32" je nach Bedarf
  };

  system.stateVersion = "25.05";
}
