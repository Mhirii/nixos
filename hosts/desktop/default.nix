{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/bundle.nix
  ];


  powerManagement.cpuFreqGovernor = "performance";
}
