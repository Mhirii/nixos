{ pkgs, ... }:
{
  networking = {
    # wireless.enable = true; #user networkmanager instead
    # hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall = {
      enable = false;
      allowedTCPPorts = [ 22 80 443 59010 59011 ];
      allowedUDPPorts = [ 59010 59011 ];
      # allowedUDPPortRanges = [
      # { from = 4000; to = 4007; }
      # { from = 8000; to = 8010; }
      # ];
    };
  };
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
