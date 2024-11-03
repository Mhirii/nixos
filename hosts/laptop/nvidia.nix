{
  lib,
  prefs,
  ...
}: let
  enable = prefs.enablePrime && !prefs.disableGpu;
  nvidiaConfig = {
    hardware.nvidia = lib.mkIf enable {
      prime = {
        # sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:2:0:0";
      };
    };
  };
in {
  config = lib.mkMerge [
    nvidiaConfig
  ];
}
