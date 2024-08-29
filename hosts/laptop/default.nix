{ pkgs, ... }:
{
  imports = [
    ../../modules/bundle.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixos-laptop";

  users.users."mhiri".packages = with pkgs;[
    acpi
  ];

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
