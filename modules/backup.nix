{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.timl.backup;
  excludeFile = pkgs.writeText "restic-excludes.txt"
    ''
      /home/timl/.bash_history
      /home/timl/.bash_profile
      /home/timl/.bashrc
      /home/timl/.cache
      /home/timl/.config
      /home/timl/.docker
      /home/timl/.gnupg
      /home/timl/.local
      /home/timl/.mozilla
      /home/timl/.nix-defexpr
      /home/timl/.nix-profile
      /home/timl/.pki
      /home/timl/.profile
      /home/timl/.vim
      /home/timl/.viminfo
      /home/timl/.vscode
      /home/timl/.zshenv
      /home/timl/.zsh_history
      /home/timl/.zshrc
      /home/timl/go
      /home/timl/Arduino
      /home/timl/privat
      /home/timl/Games
      node_modules
      __pycache__
      /home/timl/nobackup
      !/home/timl/.mozilla/firefox/**/bookmarkbackups
      !/home/timl/.local/share/Trash
      !/home/timl/.local/share/PrismLauncher
    '';
in
{
  options.timl.backup = {
    enable = mkEnableOption "restic backup";
  };

  config = mkIf (cfg.enable)
    {

    services.restic.backups.hetzner = {
        user = "timl";
        initialize = true;

        repository = "s3:nbg1.your-objectstorage.com/laptop-backup-timl";

        paths = [ "/home/timl" ];
        extraBackupArgs = [ "--exclude-caches" "--exclude-file=${excludeFile}" ];
        environmentFile = "/home/timl/privat/restic-env-laptop";

        # timerConfig = {
        #   OnCalendar = "02:30";
        #   Persistent = true;       # run on next boot if missed
        # };

        pruneOpts = [
          "--keep-daily 7"
          "--keep-weekly 4"
          "--keep-monthly 6"
        ];
      };

      services.restic.backups.center = {
        user = "timl";
        initialize = true;
        passwordFile = config.age.secrets.resticPassword.path;
        repository = "sftp:timl@center:/home/timl/backup";
        paths = [ "/home/timl" ];
        extraBackupArgs = [ "--exclude-caches" "--exclude-file=${excludeFile}" ];
        timerConfig = null;
      };
    };
}
