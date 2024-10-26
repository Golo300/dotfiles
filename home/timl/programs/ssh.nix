{ config, lib, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      mandalore-nixos = {
        host = "hetzner";
        hostname = "188.245.188.130";
        port = 22;
        user = "timl";
        identityFile = [
          "~/.ssh/hetzner/id_ed25519"
          "~/.ssh/hetzner/id_ed25519.pub"
        ];
      };
    };
  };
}
