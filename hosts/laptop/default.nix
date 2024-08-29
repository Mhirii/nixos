{ pkgs, ... }:
{
  imports = [
    ../../modules/bundle.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixos-laptop";
  # powerManagement.cpuFreqGovernor = "performance";
}
