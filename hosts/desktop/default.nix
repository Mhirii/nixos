{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/bundle.nix
  ];

  networking.hostName = "nixos-desktop";
  powerManagement.cpuFreqGovernor = "performance";
}
