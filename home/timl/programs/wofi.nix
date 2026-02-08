{ config, lib, pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
    };
  };

  xdg.configFile."wofi/style.css".text = ''
          * {
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 14px;
    }

    window {
        margin: 0px;
        border: 2px solid #bd93f9;
        background-color: #282a36;
        border-radius: 12px;
    }

    #input {
        margin: 10px;
        padding: 10px;
        border: none;
        border-radius: 8px;
        color: #f8f8f2;
        background-color: #44475a;
    }

    #inner-box {
        margin: 5px;
        border: none;
        background-color: transparent;
    }

    #outer-box {
        margin: 5px;
        border: none;
        background-color: transparent;
    }

    #scroll {
        margin: 0px;
        border: none;
    }

    #text {
        margin: 5px;
        border: none;
        color: #f8f8f2;
    }

    #entry:selected {
        background-color: #44475a;
        border-radius: 8px;
    }

    #entry:selected #text {
        color: #bd93f9;
        font-weight: bold;
    }

    #text:selected {
        background-color: transparent;
    }
  '';
}
