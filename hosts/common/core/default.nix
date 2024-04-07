{ config, inputs, pkgs, ... }:
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

  hardware.pulseaudio.enable = true;

  # basic packages for all systems
  environment.systemPackages = with pkgs; [
    vim
    git
    docker-compose
    rclone
    restic
  ];

}
