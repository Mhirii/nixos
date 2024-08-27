{ pkgs, ... }:
{
  imports = [
    ../../modules/bundle.nix
  ];
  networking.hostName = "nixos-laptop";
  powerManagement.cpuFreqGovernor = "performance";
}
