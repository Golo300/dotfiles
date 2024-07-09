{ config, lib, pkgs, ... }:

let 
   brancherer = pkgs.writeShellApplication {
    name = "branch";
    runtimeInputs = [ pkgs.openssh ];
    text = ''
      ${pkgs.git}/bin/git branch | grep -v "^\*" | ${pkgs.fzf}/bin/fzf --height=20% --reverse --info=inline | xargs ${pkgs.git}/bin/git checkout
    '';
  };
in
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
  home.packages =  [ brancherer ];
}
