{pkgs, ...}: {
  networking = {
    # wireless.enable = true; #user networkmanager instead
    # hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];
    firewall = {
      enable = true;
      allowedTCPPorts = [22 80 443 59010 59011];
      allowedUDPPorts = [59010 59011];
      extraCommands = ''
        iptables -I INPUT 1 -i docker0 -p tcp -d 172.17.0.1 -j ACCEPT
        iptables -I INPUT 2 -i docker0 -p udp -d 172.17.0.1 -j ACCEPT
        iptables -I INPUT 3 -s 172.16.0.0/12 -p tcp -d 172.17.0.1 -j ACCEPT
        iptables -I INPUT 4 -s 172.16.0.0/12 -p udp -d 172.17.0.1 -j ACCEPT
      '';
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
