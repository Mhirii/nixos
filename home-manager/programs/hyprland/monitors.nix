{ profile, ... }:
let
  monitor = {
    laptop = [
      "Unknown-1, disable"
      "eDP-1, preferred, auto, 1.00 "
      "HDMI-A-2 , 1920x1080@60, -1920x0, 1"
    ];
    desktop = [
      "Unknown-1, disable"
      ", preferred, auto, 1.00 "
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {

    #monitor= eDP-1, 1920x1080@60.00000, 0x0, 1
    monitor = monitor.${profile};
  };
}
