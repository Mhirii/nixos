{...}: {
  security.rtkit.enable = true;
  system.stateVersion = "24.05";
  imports =
    [(import ./boot.nix)]
    ++ [(import ./i18n.nix)]
    ++ [(import ./hardware)]
    ++ [(import ./nix.nix)]
    ++ [(import ./variables.nix)]
    ++ [(import ./services.nix)]
    ++ [(import ./user.nix)]
    ++ [(import ./desktops)]
    ++ [(import ./packages.nix)]
    ++ [(import ./polkit.nix)];
}
