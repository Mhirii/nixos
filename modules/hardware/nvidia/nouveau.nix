{
  boot.extraModprobeConfig = ''
  '';

  services.udev.extraRules = ''
  '';
  boot.blacklistedKernelModules = [];

  services.xserver.videoDrivers = [];

  hardware.nvidia = {};
}
