{ config, ... }:
{
  hardware.nvidia = {
    prime = {
      offload = {
        enable = false;
        enableOffloadCmd = false;
      };
      # sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
  };
}
