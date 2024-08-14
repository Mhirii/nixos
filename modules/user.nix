{pkgs, username, ...}:{
  users.users.mhiri = {
    isNormalUser = true;
    description = "Mhiri";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };
  nix.settings.allowed-users = [ "mhiri" ];
}
