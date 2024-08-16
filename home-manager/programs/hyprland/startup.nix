{

  wayland.windowManager.hyprland = {
    settings.exec-once = [
      "hyprpaper"
      "nm-applet --indicator"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "wl-paste -t text --watch clipman store"
      "wl-clipboard-history -t"
      "wl-paste --watch cliphist store"
      "swaync"
      "waybar"
    ];
  };
}
