{ pkgs, username, ... }: 
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "mhiri";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
