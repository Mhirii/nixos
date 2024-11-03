{
  lib,
  prefs,
  ...
}: let
  nvidiaConfig = {
    hardware.nvidia = lib.mkIf (prefs.prime && prefs.nvidiaOffload) {
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
