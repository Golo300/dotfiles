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
  hardware.nvidia.open = false;

  system.stateVersion = "25.05";
}
