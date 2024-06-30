{ lib, config, pkgs, inputs, ... }:
let
  # Shorter name to access final settings a 
  # user of hello.nix module HAS ACTUALLY SET.
  # cfg is a typical convention.
  cfg = config.git-cloner;
in
{
  options.git-cloner = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the git-cloner service.";
    };

    targetDirectory = lib.mkOption {
      type = lib.types.str;
      default = "cloned_repos";
      description = "Target directory to clone repositories into.";
    };

    repositories = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "List of Git repository URLs to clone.";
    };
  };

  config = lib.mkIf cfg.enable
    {
      systemd.services.git-cloner = {
        description = "Git Cloner Service";
        after = [ "network-online.target" "sshd.service" "multi-user.target" ];
        wants = [ "network-online.target" "sshd.service" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          ExecStart = "${inputs.git-cloner.packages.x86_64-linux.default}/bin/git-cloner -d ${config.git-cloner.targetDirectory} ${lib.concatStringsSep " " config.git-cloner.repositories}";
          User = "timl";
          #ExecStartPre = "${pkgs.coreutils}/bin/bash -c 'while ! command -v ssh > /dev/null 2>&1; do sleep 1; done'";
          #Restart = "always";
        };
      };
    };
}
