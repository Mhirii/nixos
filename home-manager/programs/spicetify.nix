{pkgs, lib, inputs, ...}: 
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
{ 
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  programs.spicetify = {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       shuffle # shuffle+ (special characters are sanitized out of extension names)
      listPlaylistsWithSong
      goToSong
     ];
    enabledCustomApps = [
      spicePkgs.apps.marketplace
    ];
     theme = spicePkgs.themes.lucid;
   };
}
