{ prefs, pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = !prefs.gdm;
    enableHidpi = true;
    theme = "sugar-dark";
  };
  environment.systemPackages = let themes = pkgs.callPackage ../../nixpkgs/pkgs/sddm-themes.nix { }; in [
    pkgs.kdeconnect
    # this doesn't do much, but makes it easier to see the settings
    pkgs.sddm-kcm
    themes.sddm-sugar-dark
  ];
}
