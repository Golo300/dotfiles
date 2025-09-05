{ config, lib, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      mandalore-nixos = {
        host = "hetzner";
        hostname = "91.98.132.111";
        port = 22;
        user = "root";
        identityFile = [
          "~/.ssh/hetzner/id_ed25519"
          "~/.ssh/hetzner/id_ed25519.pub"
        ];
      };
    };
  };
}
