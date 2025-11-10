{pkgs, ...}: {
  # services.dnsmasq = {
  #   enable = true;
  #   package = pkgs.dnsmasq;
  #   extraConfig = ''
  #     address=/mhiri-dev.tn/127.0.0.1
  #   '';
  # };

  networking = {
    # wireless.enable = true; #user networkmanager instead
    # hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];
    hosts = {
      "172.17.0.1" = ["host.docker.internal"];
    };
    # resolvConf = {
    #   # Point your system resolver to dnsmasq at localhost
    #   # You may need to adjust this depending on your system resolver setup
    #   # For systemd-resolved, you may need additional config
    #   nameservers = ["127.0.0.1"];
    # };
    firewall = {
      enable = false;
      allowedTCPPorts = [22 80 443 3000 8080 8081 8082 8083 8443 59010 59011];
      allowedUDPPorts = [8080 8081 8082 8083 59010 59011];
      trustedInterfaces = ["docker0" "bridge"];
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
