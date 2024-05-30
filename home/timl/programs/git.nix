{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Tim Lanzinger";
    userEmail = "tim.lanzinger@gmx.de";
    extraConfig = {

      push =
        {
          autoSetupRemote = true;
        };
      pull =
        {
          rebase = true;
        };
    };

  };
}
