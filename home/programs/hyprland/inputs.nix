{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
        tap-to-click = true;
        disable_while_typing = true;
      };

      # -1.0 - 1.0, 0 means no modification.
      sensitivity = 0;
    };

    gestures = {
      workspace_swipe = "on";
    };
  };
}
