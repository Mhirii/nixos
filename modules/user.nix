{ pkgs, username, ... }: {
  users.users.mhiri = {
    isNormalUser = true;
    description = "Mhiri";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "mhiri" ];
}
