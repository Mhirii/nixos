{ ... }: {
  wayland.windowManager.hyprland.settings = {


    #monitor= eDP-1, 1920x1080@60.00000, 0x0, 1
    monitor = [
      "Unknown-1, disable"
      ", preferred, auto, 1.00 "
      # "monitor= , preferred, 1920x0, 1.00"
      # "HDMI-A-2 , 1920x1080@60, -1920x0, 1"
      # "HDMI-A-2 , 1920x1080@60, 0x0, 1"
    ];
  };
}
