{
  config,
  profile,
  prefs,
  ...
}: let
  getNvidiaDriver = profile:
    with config.boot.kernelPackages.nvidiaPackages;
      if profile == "laptop"
      then stable
      else production;

  disableOffload = {enable = false;};
  enableOffload = {
    enable = true;
    enableOffloadCmd = true;
  };
  offload = profile:
    if profile == "laptop"
    then
      if prefs.nvidiaOffload
      then enableOffload
      else disableOffload
    else disableOffload;
in {
  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      # this fixes chromium but breaks about everything else
      # package = getNvidiaDriver profile;
      #
    };
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = true;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    package = getNvidiaDriver profile;

    prime.offload = offload profile;
  };
}
