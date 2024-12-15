{
  config,
  lib,
  prefs,
  ...
}: let
  enable = !prefs.disableGpu;
in {
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = lib.mkIf enable ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
