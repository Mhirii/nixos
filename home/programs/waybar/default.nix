{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
  };
  # programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
  #   mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  # });

  imports = [ (import ./settings.nix) ]
    ++ [ (import ./style.nix) ];
}
