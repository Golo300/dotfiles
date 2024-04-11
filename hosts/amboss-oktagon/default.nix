# main file for amboss-pktagon
{ config, inputs, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../common/core

      # desktop config
      ../common/optional/desktop/hyperland.nix

      # users
      ../user/timl
    ];

  # virtualisation
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;

  system.stateVersion = "23.05";
}
