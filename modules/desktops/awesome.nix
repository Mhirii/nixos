{
  prefs,
  lib,
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = lib.mkDefault prefs.awesomewm;
      windowManager.awesome = {
        enable = prefs.awesomewm;
        luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];
      };
    };
    # displayManager = {
    #   sddm.enable = true;
    #   defaultSession = "none+awesome";
    # };
  };
}
