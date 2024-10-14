{
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.settings = with config.colorScheme.colors; {
    general = {
      gaps_in = 4;
      gaps_out = 4;
      border_size = 3;
      "col.active_border" = lib.mkDefault " ${base0D} 45deg";
      "col.inactive_border" = lib.mkDefault "rgba(00000000)";
    };
    misc = {
      vfr = true;
    };

    decoration = {
      rounding = 8;
      blur = {
        enabled = true;
        size = 3;
        passes = 4;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
        noise = 0.06;
        brightness = 0.7;
      };

      dim_inactive = false;
      dim_strength = 0.1;
      dim_special = 0.4;
      dim_around = 0.4;
      inactive_opacity = 0.95;

      blurls = ["rofi" "mako" "launcher" "bar0"];

      drop_shadow = false;
      shadow_range = 10;
      shadow_render_power = 10;
      "col.shadow" = lib.mkDefault "rgba(${base00}70)";
    };

    animations = {
      enabled = "yes";
      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "bezier2, 0.5, 0.1, 0.5, 0.9"
        "border, 0.2, 0.3, 0.8, 0.7"
      ];
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 6, default, popin 90%"
        "borderangle, 1, 10, border, loop"
        "fade, 1, 7, default"
        "workspaces, 1, 5, default"
        "specialWorkspace, 1, 3, myBezier, slidevert"
      ];
    };
  };
}
