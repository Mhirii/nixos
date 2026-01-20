{
  username,
  pkgs,
  ...
}: {
  services = {
    cron.enable = true;
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              rightalt = "layer(rightalt)";
            };
            rightalt = {
              h = "left";
              j = "down";
              k = "up";
              l = "right";
            };
          };
        };
      };
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };

    displayManager.autoLogin = {
      enable = false;
      user = "${username}";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };

    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };
    dbus.enable = true;
  };

  systemd.services = {
    # https://github.com/NixOS/nixpkgs/issues/59603#issuecomment-1356844284
    NetworkManager-wait-online.enable = false;
  };

  # To prevent getting stuck at shutdown
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = false;
      setSocketVariable = true;
    };
    enableNvidia = false;
  };
}
