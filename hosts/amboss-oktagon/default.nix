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
  # virtualisation
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "timl" ];
  nixpkgs.config.allowUnfree = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  services.xserver.videoDrivers = [ "amdgpu" ];

  system.stateVersion = "23.05";
}
