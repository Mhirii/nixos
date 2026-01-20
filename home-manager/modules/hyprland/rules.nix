{...}: let
  opacity = "0.8";

  float_windowrule = let
    f = regex: "float, class:^(${regex})$";
  in [
    (f "pavucontrol")
    (f "nm-connection-editor")
    (f "blueberry.py")
    (f "org.gnome.Settings")
    (f "org.gnome.design.Palette")
    (f "Color Picker")
    (f "xdg-desktop-portal")
    (f "xdg-desktop-portal-gnome")
  ];

  opacity_windowrule = let
    o = regex: "opacity ${opacity} override ${opacity} override, class:^(${regex})$";
  in [
    (o "thunar")
    (o "Spotify")
    (o "WebCord")
    (o "Code")
    (o "mako")
  ];
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = "master";
    };

    master = {
      #enable adding additional master windows in a horizontal split style
      allow_small_split = false;
      #(0.0 - 1.0) the scale of the special workspace windows
      special_scale_factor = 0.9;
      #	(0.0 - 1.0) master split factor, the ratio of master split
      mfact = 0.5;
      #default placement of the master area, can be left, right, top, bottom or center
      orientation = "left";
      #inherit fullscreen status when cycling/swapping to another window (e.g. monocle layout)
      inherit_fullscreen = "yes";
      #if enabled, resizing direction will be determined by the mouse’s position on the window (nearest to which corner). Else, it is based on the window’s tiling position.
      smart_resizing = "yes";
      #when enabled, dragging and dropping windows will put them at the cursor position. Otherwise, when dropped at the stack side, they will go to the top/bottom of the stack depending on new_on_top.
      drop_at_cursor = "yes";
    };

    windowrule =
      float_windowrule
      ++ opacity_windowrule;

    layerrule = [
      "blur , waybar"
      "blur , overlay"
      "ignorezero , waybar"
    ];

    blurls = ["thunar"];

    windowrulev2 = [
      "opacity 0.7 0.7,floating:1"
      "float,class:^()$,title:^(Picture in picture)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(xdg-desktop-portal-gtk)$"
      "float,class:^(xdg-desktop-portal-kde)$"
      "float,class:^(xdg-desktop-portal-hyprland)$"
      "float,title:^(submap)$"
      "center 1,title:^(submap)$"
      "tile, title:(Developer Tools.*)"
      "center 1, initialTitle:^(File Upload)$"
      "size 80% 70%, initialTitle:^(File Upload)$"
    ];
  };
}
