{prefs, ...}: let
  offload = {
    enable = prefs.enablePrime && !prefs.disableGpu && prefs.enableOffload;
    enableOffloadCmd = true;
  };
in {
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";

    offload = offload;
  };
}
