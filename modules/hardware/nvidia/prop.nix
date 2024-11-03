{
  config,
  lib,
  prefs,
  ...
}: {
  hardware.opengl.enable = true;

  services.xserver.videoDrivers = lib.mkIf (!prefs.disableGpu) ["nvidia"];

  hardware.nvidia = lib.mkIf (!prefs.disableGpu) {
    modesetting.enable = true;

    powerManagement.enable = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
