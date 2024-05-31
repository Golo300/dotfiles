{ config, inputs, pkgs, neovim, ... }:

{
  imports =
    [
      ./desktop/hyperland.nix

      ./programs/sh.nix
      ./programs/git.nix
      ./programs/vscode.nix
      ./programs/lf.nix
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
  
    pkgs.evince # gnome pdf reader
    pkgs.gnome.eog # gnome image viewer
    pkgs.pistol
    pkgs.file
  ];

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # set firefox as default browser
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";

      # pdf
      "application/pdf" = "org.gnome.Evince.desktop";

      # images
      "image/png" = "org.gnome.eog.desktop";
      "image/jpeg" = "org.gnome.eog.desktop";
    };
  };


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
