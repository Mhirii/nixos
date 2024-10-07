{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
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
    # ./ags.nix
    ./variables.nix
  ];
}
