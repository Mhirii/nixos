let
  terminal = "kitty";
  manup_window = key1: key2: dir: {
    arr = [
      "SUPER, ${key1}, movefocus, ${dir}"
      "SUPER SHIFT, ${key1}, movewindow, ${dir}"
      "SUPER, ${key2}, movefocus, ${dir}"
      "SUPER SHIFT, ${key2}, movewindow, ${dir}"
    ];
  };
  left = manup_window "left" "h" "l";
  right = manup_window "right" "l" "r";
  up = manup_window "up" "k" "u";
  down = manup_window "down" "j" "d";
  window_move = left.arr ++ right.arr ++ up.arr ++ down.arr;

  resize = [
    "SUPER CTRL, right,        resizeactive,                   10 0"
    "SUPER CTRL, left,         resizeactive,                   -10 0"
    "SUPER CTRL, up,           resizeactive,                   0 -10"
    "SUPER CTRL, down,         resizeactive,                   0 10"
    "SUPER CTRL, l,            resizeactive,                   10 0"
    "SUPER CTRL, h,            resizeactive,                   -10 0"
    "SUPER CTRL, k,            resizeactive,                   0 -10"
    "SUPER CTRL, j,            resizeactive,                   0 10"
  ];

  characters = [ "1" "2" "3" "4" "5" "6" "u" "i" "o" "p" ];
  workspaces = builtins.genList (x: builtins.toString (x + 1)) 10;
  workspace_bindings = builtins.concatLists (builtins.genList
    (
      x:
      let
        ws = builtins.elemAt workspaces x;
        char = builtins.elemAt characters x;
      in
      [
        "SUPER, ${char}, workspace, ${ws}"
        "SUPER CTRL, ${char}, focusworkspaceoncurrentmonitor, ${ws}"
        "SUPER SHIFT, ${char}, movetoworkspace, ${ws}"
        "SUPER ALT, ${char}, movetoworkspacesilent, ${ws}"
      ]
    ) 10);

  scratchpads = [
    "SUPER,       S,            togglespecialworkspace"
    "SUPER SHIFT, S,            movetoworkspace,                special"
    "SUPER ALT,   S,            movetoworkspacesilent,          special"
    "SUPER,       A,            togglespecialworkspace,         second"
    "SUPER SHIFT, A,            movetoworkspace,                special:second"
    "SUPER ALT,   A,            movetoworkspacesilent,          special:second"
    "SUPER,       D,            togglespecialworkspace,         third"
    "SUPER SHIFT, D,            movetoworkspace,                special:third"
    "SUPER ALT,   D,            movetoworkspacesilent,          special:third"
  ];
  cycle = [
    "Alt,         Tab,          cyclenext"
    "Alt,         Tab,          bringactivetotop"
  ];

  monitors = [
    "SUPER,       M,            focusmonitor,                   +1"
    "SUPER,       BracketRight, focusmonitor,                   -1"
    "SUPER,       BracketLeft,  focusmonitor,                   +1"
    "SUPER SHIFT, M,            movecurrentworkspacetomonitor,  +1"
    "SUPER SHIFT, BracketRight, movecurrentworkspacetomonitor,  -1"
    "SUPER SHIFT, BracketLeft,  movecurrentworkspacetomonitor,  +1"
    "SUPER CTRL,  Tab,          swapactiveworkspaces,           0 1"
  ];

  apps = [
    "SUPER, return, exec, ${terminal}"
    "SUPER, T, exec, $launch tmux"
    "SUPER, b, exec, [workspace 2 silent] $launch browser"
    "SUPER, e, exec, thunar"
    "SUPER, R, exec, rofi -show drun"
    "SUPER, N, exec, swaync-client -t"
    "SUPER SHIFT, N, exec, neovide"
  ];

  utils = [
    "SUPER SHIFT, equal,  exec, hyprpicker -a"
    "SUPER, V,  exec, $launch clipboard"
    ", print,  exec, hyprshot -m output"
    "CTRL, print,  exec, hyprshot -m region"
    "SHIFT, print,  exec, hyprshot -m window"
  ];

  session = [
    "SUPER, Q, killactive,"
    "SUPER ALT, Q, exit,"
    "SUPER SHIFT, R, exec, hyprctl reload"
    "SUPER SHIFT, escape, exec,         hyprlock"
    "SUPER SHIFT, B, exec, killall -SIGUSR1 waybar"
  ];

  media = [
    ",            xf86AudioMicMute,      exec, $scripts/volume.fish --toggle-mic"
    ",            xf86audioMute,         exec, $scripts/volume.fish mute"

    ",            xf86AudioPlay,         exec, playerctl play-pause"
    ",            xf86AudioNext,         exec, playerctl next"
    ",            XF86AudioPrev,         exec, playerctl previous"

    "SUPER,      0,                     exec, $scripts/volume.fish mute"
    "SUPER CTRL, equal,                 exec, playerctl next"
    "SUPER CTRL, minus,                 exec, playerctl play-pause"
    "SUPER CTRL, 0,                     exec, playerctl previous"
    "SUPER,      7,                     exec, playerctl previous"
    "SUPER,      8,                     exec, playerctl play-pause"
    "SUPER,      9,                     exec, playerctl next"

  ];
  media_e = [
    ",            xf86audioraisevolume,  exec, $scripts/volume.fish inc"
    ",            xf86audiolowervolume,  exec, $scripts/volume.fish dec"

    ",            xf86MonBrightnessDown, exec, $scripts/brightness --dec"
    ",            xf86MonBrightnessUp,   exec, $scripts/brightness --inc"

    "SUPER,      equal,                 exec, $scripts/volume.fish inc"
    "SUPER,      minus,                 exec, $scripts/volume.fish dec"

    "SUPER ALT,  minus,                 exec, $scripts/brightness --dec"
    "SUPER ALT,  equal,                 exec, $scripts/brightness --inc"
  ];

  window = [
    "SUPER,       F,            fullscreen,"
    "SUPER SHIFT, F,            togglefloating,"
    ",            F11,          fakefullscreen"
    "SUPER,       Y,            pin"
    "SUPER CTRL,  F,            centerwindow,"
    "SUPER ALT,   TAB,          layoutmsg,                      swapwithmaster master,"
  ];

in
{


  wayland.windowManager.hyprland.settings = {
    "$scripts" = "~/.config/hypr/scripts";
    "$launch" = "$scripts/launch.fish";
    bind =
      apps
      ++ utils
      ++ session
      ++ window_move
      ++ window
      ++ workspace_bindings
      ++ scratchpads
      ++ cycle
      ++ monitors
      ++ media
    ;
    binde = resize
      ++ media_e;

    bindm = [
      "SUPER,      mouse:272,    movewindow"
      "SUPER,      mouse:273,    resizewindow"
    ];

  };
}
