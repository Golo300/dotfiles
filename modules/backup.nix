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
      /* restic backup service to backblaze b2 bucket */
      services.restic.backups.b2 = {
        user = "timl";
        initialize = true;
        passwordFile = config.age.secrets.resticPassword.path;
        repository = "s3:https://s3.us-west-002.backblazeb2.com/Backup-thinkpad";
        environmentFile = config.age.secrets.backblazeB2ResticS3EnvironmentSecrets.path;
        paths = [ "/home/timl" ];
        pruneOpts = [
          "--keep-hourly 48"
          "--keep-daily 7"
          "--keep-weekly 4"
          "--keep-monthly 12"
          "--keep-yearly 5"
        ];
        extraOptions = [ "s3.region=us-west-002" ];
        extraBackupArgs = [ "--exclude-caches" "--exclude-file=${excludeFile}" ];
        timerConfig = null; /*{
          OnCalendar = "daily";
          Persistent = true;
        };*/
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
