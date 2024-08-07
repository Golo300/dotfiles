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

  system.stateVersion = "23.05";
}
