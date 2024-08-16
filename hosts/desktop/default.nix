{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/bundle.nix
  ];

  networking.hostName = "desktop";


  powerManagement.cpuFreqGovernor = "performance";
}
