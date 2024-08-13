{pkgs, ...}:{
  programs.fish.enable = true;
  users.users.mhiri = {
    isNormalUser = true;
    description = "Mhiri";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };
}
