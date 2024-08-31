{ unstable_pkgs, config, pkgs, spicetify-nix, inputs, ... }:
{

  home.username = "mhiri";
  home.homeDirectory = "/home/mhiri";
  home.stateVersion = "18.09";
  programs.home-manager.enable = true;

  home.packages = [ ];

  home.file = { };



  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./programs
  ];

}
