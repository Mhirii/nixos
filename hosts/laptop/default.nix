{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../modules/bundle.nix
    ./hardware-configuration.nix
    ./nvidia.nix
  ];
  networking.hostName = "nixos-laptop";

  users.users."mhiri".packages = with pkgs; [
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

  # environment.sessionVariables.VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";

  specialisation = {
    proprietary.configuration = {
      imports = [
        ../../modules/hardware/nvidia/prop.nix
      ];
    };
    prime.configuration = {
      imports = [
        ../../modules/hardware/nvidia/prop.nix
        ../../modules/hardware/nvidia/prime.nix
      ];
    };
    disableGpu.configuration = {
      imports = [
        ../../modules/hardware/nvidia/disable.nix
      ];
    };
  };

  boot = {
    kernelModules = ["acpi_call"];
    extraModulePackages =
      with config.boot.kernelPackages; [
        acpi_call
        # cpupower
      ]
      # ++ [ pkgs.cpupower-gui ]
      ;
  };
}
