{ ... }: {
  security.rtkit.enable = true;
  system.stateVersion = "24.05";
  imports =
    [ (import ../nixos/configuration.nix) ]
    ++ [ (import ./boot.nix) ]
    ++ [ (import ./i18n.nix) ]
    ++ [ (import ./hardware) ]
    ++ [ (import ./nix.nix) ]
    ++ [ (import ./variables.nix) ]
    ++ [ (import ./program.nix) ]
    ++ [ (import ./services.nix) ]
    ++ [ (import ./user.nix) ]
    ++ [ (import ./hyprland.nix) ]
    ++ [ (import ./gnome.nix) ]
    ++ [ (import ./packages.nix) ]
  ;
}
