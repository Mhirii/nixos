{ pkgs, config, ... }:
{
  imports = [
    ../../modules/bundle.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixos-laptop";

  users.users."mhiri".packages = with pkgs;[
    acpi
    go-upower-notify
    upower
    brightnessctl
    cpupower-gui
    powertop
  ];
  services = {

    upower.enable = true;
    auto-cpufreq = {
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
  };

  # boot = {
  #   kernelModules = ["acpi_call"];
  #   extraModulePackages = with config.boot.kernelPackages;
  #     [
  #       acpi_call
  #       cpupower
  #     ]
  #     ++ [pkgs.cpupower-gui];
  # };
}
