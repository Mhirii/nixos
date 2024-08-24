{ config, ... }:
let
  base16 = config.stylix.base16Scheme;
  custom = {
    font = "MonaspiceNe Nerd Font";
    font_size = "15px";
    font_weight = "bold";
    pad_adjacents = "6px";
  };
in
{
  stylix.targets.waybar.enable = false;
  programs.waybar.style = #css
    ''
            @define-color bg alpha(${base16.base00}, 0.9);
            @define-color translucent alpha(${base16.base00}, 0.5);
            @define-color bg-lighter shade(mix(@bg, ${base16.base07}, 0.2), 1.2);
            @define-color borderColor alpha(@bg-lighter, 0.8);
            @define-color layer alpha(@bg, 0.3);
            @define-color bg_selected alpha(mix(@layer, ${ base16.base07 }, 0.3), 0.5);
            @define-color text_inactive ${base16.base05};
            @define-color text_muted ${base16.base06};
            @define-color text_active ${base16.base07};
            @define-color accent ${base16.base0D};

            @keyframes changebg {
              0% {
                background: linear-gradient(
                -60deg,
                @bg,
                @bg,
                mix(@accent, @bg, 0.1)
                );
                border-radius: 20px;
              }
              5% {
                background: linear-gradient(
                60deg,
                @bg,
                mix(@accent, @bg, 0.9),
                mix(@accent, @bg, 0.5)
                );
                border-radius: 15px;
              }

              15% {
                background: linear-gradient(180deg, @bg, mix(@accent, @bg, 0.8));
                border-radius: 9px;
              }

              30% {
                background: linear-gradient(360deg, @bg_selected );
                border-color: @borderColor;
                border-radius: 8px;
              }
            }

            #submap,
            #mpris,
            #pulseaudio,
            #cpu,
            #backlight,
            #tray,
            #clock,
            #bluetooths,
            #bluetooth,
            #bluetooth.on,
            #bluetooth.connected,
            #networks,
            #taskbar,
            #hardware {
              border: 0px solid @borderColor;
              border-radius: 8px;
              margin: 2px;
              padding: 2px;
              opacity: 0.9;
              padding-bottom: 0px;
            }

            * {
              border: none;
              border-radius: 0px;
              padding: 0;
              margin: 0;
              min-height: 0px;
              font-family: "MonaspiceNe Nerd Font";
              font-weight: 600;
              opacity: 0.95;
            }

            window#waybar {
              background-color: @translucent;
              border-radius: 0px;
              padding: 2px;
              transition-property: background-color;
              transition-duration: 0.5s;
            }

            #workspaces {
              font-size: 18px;
              font-weight: bold;
              font-style: normal;
              padding: 0px 1px;
              border-radius: 8px;
              border: 1px solid;
              border-color: @borderColor;
              margin: 4px 8px;
              opacity: 0.9;
              background: @layer;

            }
            #workspaces button {
              padding: 0px;
              padding-left: 5px;
              padding-right: 0px;
              margin: 2px 1px;
              border-radius: 8px;
              border: 1px solid transparent;
              color: ${base16.base07};
              background-color: transparent;
              transition: all 0.3s ease-in-out;
              opacity: 0.6;
              min-width: 30px;
            }
            #workspaces button.empty {
              color: @text_inactive ;
              background-color: transparent;
              transition: all 0.3s ease-in-out;
              opacity: 0.2;
            }
            #workspaces button.active {
              color: @accent ;
              animation-duration: 8s;
              animation-name: changebg;
              animation-iteration-count: 1;
              animation-direction: alternate;
              animation-timing-function: ease-out;
              background-color: @bg_selected;
              border: 1px solid;
              border-color: @borderColor;
              border-radius: 8px;
              transition: all 0.3s ease-in-out;
              opacity: 1;
            }

            #tray {
              border-radius: 8px;
              background-color: @layer;
              border: 1px solid;
              border-color: @borderColor;
              margin: 2px 0px;
              padding: 0px 12px;
            }

            #tray > .passive {
              -gtk-icon-effect: dim;
            }

            #tray > .needs-attention {
              -gtk-icon-effect: highlight;
            }

            #mpris {
              /* background-color: @bg; */
              color: @text_color;
              padding: 0px 8px;
              margin: 2px 8px;
              border-radius: 8px;
              border: 0px solid @borderColor;
            }
            #mpris.spotify {
              color: ${base16.base0B};
            }
            #mpris.chromium {
              color: @text_color;
            }
            #mpris.paused {
              color: @text_inactive;
            }

            #pulseaudio,
            #bluetooths,
            #cpu,
            #battery,
            #backlight {
              background-color: @layer;
              color: @text_color;
              margin-right: 0px;
              margin-left: 0px;
              padding-right: 4px;
              padding-left: 4px;
            }
            #pulseaudio.muted {
              color: ${ base16.base08 };
            }
            #network {
              padding: 0px;
              margin: 0px;
              padding-right: 5px;
            }
            #network.info {
              padding: 0px 4px;
            }
            #bluetooth,
            #bluetooth.on,
            #bluetooth.connected {
              margin: 0px;
            }
            #bluetooth *{
              color: @text_color;
            }

            #bluetooth.info {
              padding: 0px 4px;
              color: @text_color;
            }

            @keyframes blink {
              to {
                padding-left: 4px;
                padding-right: 4px;
                color: ${ base16.base08};
              }
            }

            #battery.good {
              color: @text_color;
              animation-name: blink;
            }

            #battery.warning {
              color: ${base16.base0A};
            }

            #battery label {
              color: @text_color;
            }

            #battery.charging,
            #battery.plugged {
              color: @text_color;
            }

            #battery.critical {
              color: ${base16.base08};
            }

            #battery.critical:not(.charging) {
              background-color: @layer;
              color: ${base16.base08};
              animation-name: blink;
              animation-duration: 0.5s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
            }
            #cpu, #memory, #disk, #clock, #custom-notification {
              font-size: ${custom.font_size};
              color: @text_color;
            }

            #cpu {
              padding-left: ${custom.pad_adjacents};
              padding-right: ${custom.pad_adjacents};
            }
            #memory {
              padding-left: 9px;
              padding-right: 9px;
            }
            #disk {
              padding-left: 9px;
              padding-right: 15px;
            }

            #tray {
              padding: 0 20px;
              margin: 4px 8px;
            }

            custom-notification {
              padding-left: 20px;
              padding-right: 20px;
              margin: 4px 8px;
            }

            #custom-launcher {
              font-size: 20px;
              color: @accent;
              font-weight: ${custom.font_weight};
              padding-left: 10px;
              padding-right: 15px;
              margin: 4px 8px;
              margin-right: 4px;
            }

            #pulseaudio,
            #backlight,
            #cpu,
            #bluetooths,
            #battery{
              border: 1px solid;
              border-color: @borderColor;
              border-left: 0px;
              border-right: 0px;
              border-radius:0px;
              padding: 0px 4px;
            }
            #battery{
              padding-right: 12px;
              border-right: 1px solid;
              border-color: @borderColor;
              border-radius: 0px 8px 8px 0px;
            }
            #backlight{
              padding-right: ${custom.pad_adjacents};
              padding-left: ${custom.pad_adjacents};
              }
            #pulseaudio{
              padding-right: ${custom.pad_adjacents};
              padding-left: 20px;
              border-left: 1px solid;
              border-color: @borderColor;
              border-radius: 8px 0px 0px 8px;
            }
            #bluetooths{
              border-right: 1px solid;
              border-color: @borderColor;
              border-radius: 0px 8px 8px 0px;
              padding-left: ${custom.pad_adjacents};
              padding-right: 20px;
            }
      #clock {
        font-weight: 600;
        background-color: @layer;
        border: 1px solid;
        border-color: @borderColor;
        border-radius: 8px;
        padding-right: 20px;
        padding-left: 20px;
        margin: 4px 8px;
        margin-right: 4px;

      }

            #workspaces,
            #submap,
            #mpris,
            #pulseaudio,
            #backlight,
            #tray,
            #clock,
            #bluetooths,
            #bluetooth,
            #bluetooth.on,
            #bluetooth.connected,
            #networks,
            #taskbar,
            #cpu, 
            #battery,
            #custom-appmenuicon,
            #hardware {
              margin-bottom: 4px;
              margin-top: 4px;
              padding-bottom: 0px;
              padding-top: 0px;
            }
    '';
}


