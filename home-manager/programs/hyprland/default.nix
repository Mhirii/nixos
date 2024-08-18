{ pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
  };

  imports = [
    ./scripts
    ./startup.nix
    ./binds.nix
    ./decoration.nix
    ./monitors.nix
    ./inputs.nix
    ./rules.nix
    ./ags.nix
  ];
}
