{ pkgs, ... }:
{
  imports = [
    ./nvidia.nix
    ../../modules/bundle.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixos-laptop";

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
