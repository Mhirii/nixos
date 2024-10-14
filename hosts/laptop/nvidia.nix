{
  lib,
  prefs,
  ...
}: let
  nvidiaConfig =
    if prefs.nvidiaOffload
    then {
      hardware.nvidia = {
        prime = {
          # sync.enable = true;
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:2:0:0";
        };
      };
    }
    else {};
in {
  config = lib.mkMerge [
    nvidiaConfig
  ];
}
