{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = true;
  };

  imports = [
    ./scripts
    ./startup.nix
    ./binds.nix
    ./decoration.nix
    ./monitors.nix
    ./inputs.nix
    ./rules.nix
    ./variables.nix
  ];
}
