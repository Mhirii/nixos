{...}:{
 
  system.stateVersion = "24.05";
  imports = [
    ./sys.nix
    ./user.nix
    ./packages.nix
    ./services.nix
    #./software.nix
    ./theming.nix
    ./gnome.nix
    ./hyprland.nix
  ];
}
