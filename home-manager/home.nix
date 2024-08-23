{ config, pkgs, spicetify-nix, ... }:
{

  home.username = "mhiri";
  home.homeDirectory = "/home/mhiri";
  home.stateVersion = "18.09";
  programs.home-manager.enable = true;

  home.packages = [
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "floorp";
    TERM = "alacritty";
    TERMINAL = "alacritty";
  };


  imports = [
    ./programs
  ];

}
