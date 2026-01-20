{config, ...}: {
  boot.loader.systemd-boot = {
    enable = true;
    extraEntries = {
      "nixos-pinned-208.conf" = ''
        title NixOS (Pinned Generation 208)
        version 208
        linux /nix/store/</nix/store/dp5ls9vj76xng4jxagshfylx09jknjzi-nixos-system-nixos-laptop-24.11.20250630.50ab793>/kernel
        initrd /nix/store/</nix/store/dp5ls9vj76xng4jxagshfylx09jknjzi-nixos-system-nixos-laptop-24.11.20250630.50ab793>/initrd
        options init=/nix/store/</nix/store/dp5ls9vj76xng4jxagshfylx09jknjzi-nixos-system-nixos-laptop-24.11.20250630.50ab793>/init ${builtins.concatStringsSep " " config.boot.kernelParams}
      '';
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;
}
