{ username, pkgs, inputs, ... }: {

  # system.stateVersion = "24.05";
  imports =

    [ (import ../nixos/configuration.nix) ]
    ++ [ (import ./sys.nix) ]
    ++ [ (import ./xserver.nix) ]
    ++ [ (import ./network.nix) ]
    ++ [ (import ./pipewire.nix) ]
    ++ [ (import ./program.nix) ]
    ++ [ (import ./services.nix) ]
    ++ [ (import ./user.nix) ]
    ++ [ (import ./hyprland.nix) ]
    ++ [ (import ./gnome.nix) ]
    ++ [ (import ./packages.nix) ];
  # ++ [ inputs.stylix.nixosModules.stylix ]
  # ++ [ (import ./stylix.nix) ];
  # ++ [ (import ../home-manager/home.nix ) ];
}
