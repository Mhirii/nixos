{ inputs, pkgs, ... }:
{
  imports = [
    ./nvidia.nix
    ./hardware-configuration.nix
    ../../modules/bundle.nix
  ];

  networking.hostName = "nixos-desktop";
  powerManagement.cpuFreqGovernor = "performance";
}
