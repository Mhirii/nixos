{ profile, ... }:
let
  terminal = "kitty";
  battery = {
    laptop = [ "battery" ];
    desktop = [ ];
  };
in
{
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 5;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
      "tray"
      "hyprland/submap"
    ];
    modules-center = [
      "mpris"
      "custom/notification"
    ];
    modules-right = [
      "privacy"
      "pulseaudio"
      "backlight"
      "cpu"
      "group/bluetooths"
    ]
    ++ battery.${profile}
    ++ [ "clock" ];

    clock = {
      calendar = {
        format = { today = "<span color='#b4befe'><b><u>{}</u></b></span>"; };
      };
      format = "{:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = " {:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = " ";
        "2" = "󰈹 ";
        "3" = " ";
        "4" = "󰙯 ";
        "5" = " ";
        "6" = "󰓇 ";
        "7" = " ";
        "8" = " ";
        "9" = "󰫢 ";
        "10" = " ";
        urgent = "";
        default = " ";
      };
      persistent-workspaces = {
        "*" = [ 1 2 3 4 5 6 7 8 9 10 ];
      };
    };
    "hyprland/submap" = {
      "format" = "{}";
    };
    tray = {
      icon-size = 16;
      spacing = 8;
    };
    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
      "on-click" = "${terminal} -e btop";
    };
    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      "on-click" = "${terminal} -e btop";
      interval = 2;
    };
    disk = {
      # path = "/";
      format = "󰋊 {percentage_used}%";
      interval = 60;
      "on-click" = "${terminal} -e btop";
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰀂 ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-bluetooth = "{volume}% {icon}󰂯 {format_source}";
      format-bluetooth-muted = "󰖁 {icon}󰂯 {format_source}";
      format-muted = "  {volume}%";
      format-icons = {
        default = [ "󰕿" "󰖀" "󰕾" ];
      };
      scroll-step = 5;
      on-click = "pamixer -t";
    };
    "bluetooth" = {
      "format" = "󰂯";
      "format-connected" = "󰂱";
      "format-off" = "󰂲";
    };
    "bluetooth#info" = {
      "format" = "";
      "format-connected" = "{device_alias}";
      "format-off" = "";
    };
    "group/bluetooths" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 300;
        children-class = "network-children";
        transition-left-to-right = false;
      };
      modules = [
        "bluetooth"
        "bluetooth#info"
      ];
    };
    battery = {
      format = "{icon} {capacity}%";
      format-alt = "{icon} {capacity}% {time}";
      format-icons = [ " " " " " " " " " " ];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}% {time}";
      interval = 5;
      states = {
        warning = 20;
      };
    };
    "custom/launcher" = {
      format = "";
      on-click = "rofi -show drun";
      tooltip = "false";
    };
    "custom/notification" = {
      tooltip = false;
      format = "{icon} ";
      format-icons = {
        notification = "<span foreground='red'><sup></sup></span>   ";
        none = "   ";
        dnd-notification = "<span foreground='red'><sup></sup></span>   ";
        dnd-none = "   ";
        inhibited-notification = "<span foreground='red'><sup></sup></span>   ";
        inhibited-none = "   ";
        dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>   ";
        dnd-inhibited-none = "   ";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };

    "mpris" = {
      "format" = "{player_icon} {title} - {artist}";
      "title-len" = 40;
      "format-paused" = "{status_icon} {title} - {artist}";
      "dynamic-len" = 40;
      "player-icons" = {
        "default" = "▶";
        "mpv" = "🎵";
        "chromium" = "";
        "spotify" = "";
      };
      "status-icons" = {
        "paused" = "⏸";
      };
    };
  };
}
