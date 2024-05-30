{ config, inputs, pkgs, neovim, ... }:

{
  imports =
    [
      ./desktop/hyperland.nix

      ./programs/sh.nix
      ./programs/git.nix
      ./programs/vscode.nix
      ./programs/neovim/neovim.nix
    ];

  home.username = "timl";
  home.homeDirectory = "/home/timl";


  home.stateVersion = "23.11";

  home.packages = [
    pkgs.gnome.nautilus
    pkgs.kitty
    pkgs.discord
    pkgs.firefox
    pkgs.spotify
    pkgs.keepassxc
    pkgs.legendary-gl
    pkgs.prismlauncher
    pkgs.fceux
    pkgs.drawio
    pkgs.font-awesome
    pkgs.gccgo
    pkgs.libsForQt5.kalgebra
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
