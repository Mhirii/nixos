{ config, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 15d --keep 3";
    flake = "/home/mhiri/flake";
  };
}
