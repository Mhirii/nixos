{ lib }: {
  hardware.nvidia.prime lib.mkIf prefs.enablePrime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";

    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
}
