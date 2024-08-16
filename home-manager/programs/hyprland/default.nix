{ pkgs, lib, ... }:
let
  flake_dir = "/home/mhiri/flake";
in
{

  wayland.windowManager.hyprland = {
    enable = true;
  };

  # home.file.launch = {
  #   target = ".config/hypr/scripts/launch.fish";
  #   source = "${flake_dir}/home-manager/assets/launch.fish";
  #   executable = true;
  # };

  imports = [
    ./scripts
    ./startup.nix
    ./binds.nix
    ./decoration.nix
    ./monitors.nix
    ./inputs.nix
    ./rules.nix
  ];
}
