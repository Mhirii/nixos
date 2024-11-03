{
  lib,
  prefs,
}: {
  hardware.nvidia.prime = lib.mkIf (prefs.enablePrime && !prefs.disableGpu) {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";

    offload = {
      enable = lib.mkIf prefs.nvidiaOffload true;
      enableOffloadCmd = true;
    };
  };
}
