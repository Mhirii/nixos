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

      "hyprctl dispatch exec [workspace special silent] '$terminal -e btop'"
      "hyprctl dispatch exec [workspace 2 silent] '$HOME/.config/hypr/scripts/launch.fish' browser"
      "hyprctl dispatch exec [workspace 5 silent] discord"
      "hyprctl dispatch exec [workspace 5 silent] thunderbird"
      "hyprctl dispatch exec [workspace 6 silent] spotify"
      "hyprctl dispatch exec [workspace special:third silent] bitwarden"
    ];
  };
}
