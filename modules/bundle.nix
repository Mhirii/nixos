{...}: {
  security.rtkit.enable = true;
  system.stateVersion = "25.11";
  imports =
    [(import ./boot.nix)]
    ++ [(import ./nix.nix)]
    ++ [(import ./i18n.nix)]
    ++ [(import ./hardware)]
    ++ [(import ./variables.nix)]
    ++ [(import ./services.nix)]
    ++ [(import ./user.nix)]
    ++ [(import ./desktops)]
    ++ [(import ./packages.nix)]
    ++ [(import ./polkit.nix)];
}
