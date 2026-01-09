# main file for amboss-pktagon
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

  timl.backup.enable = true;
  services.blueman.enable = true;
  services.flatpak.enable = true;
  # virtualisation

  virtualisation.docker.enable = true;
  # virtualisation.virtualbox.host.enable = true; # for studies
  # virtualisation.virtualbox.host.enableKvm = true; # for studies
  # virtualisation.virtualbox.host.addNetworkInterface = false;

  programs.steam = {
    enable = true;
  };

  users.extraGroups.vboxusers.members = [ "timl" ];
  nixpkgs.config.allowUnfree = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true; // for studies

  services.xserver.videoDrivers = [ "amdgpu" ];

  system.stateVersion = "23.05";
}
