{ config, inputs, pkgs, neovim, ... }:

{
  imports =
    [
      ./desktop/hyperland.nix

      ./programs/sh.nix
      ./programs/git.nix
      ./programs/vscode.nix
      ./programs/neovim.nix
    ];

  home.username = "timl";
  home.homeDirectory = "/home/timl";


  home.stateVersion = "23.11";

  home.packages = [
    pkgs.kitty
    pkgs.discord
    pkgs.firefox
    pkgs.spotify
    pkgs.keepassxc
    pkgs.p3x-onenote
    pkgs.legendary-gl
    pkgs.prismlauncher
    pkgs.obsidian
    pkgs.fceux
    pkgs.jetbrains.clion
    pkgs.drawio
    pkgs.font-awesome
    pkgs.gccgo
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
