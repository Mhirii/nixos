{ inputs, pkgs, ... }:
{
  programs.home-manager.enable = true;
  home = {
    username = "mhiri";
    homeDirectory = "/home/mhiri";
  };
  imports = [
    ./gtk.nix
    ./programs
    ./mimeapps.nix
  ];
  home.stateVersion = "18.09";
}
