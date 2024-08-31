{ config, pkgs, ... }:
{

  home.packages = [ pkgs.hyprlock ];
  xdg.configFile."hypr/hyprlock.conf".text = with config.colorScheme.colors; #bash
    ''
      $background = ${base00}
      $text = ${base05}
      $red = ${base0A}
      $green = ${base0B}
      $yellow = ${base0C}
      $blue = ${base0D}
      $purple = ${base0E}
      $cyan = ${base0F}
      $accent = $cyan

      background {
        monitor = 
        path = $HOME/flake/home-manager/assets/midnight.png
        color = $background
        blur_passes = 3 # 0 disables blurring
        blur_size = 4
        noise = 0.0117
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
      }

      input-field {
        monitor =
        size = 250, 50
        outline_thickness = 3
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.64 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = $accent
        inner_color = $background
        font_color = $text
        fade_on_empty = true
        placeholder_text = <i>Password...</i> # Text rendered in the input box when it's empty.
        hide_input = false
        position = 0, 50
        halign = center
        valign = bottom
      }

      label {
        monitor =
        text = cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"
        color = $text
        font_size = 64
        font_family = MonaspiceNe Nerd Font 10
        position = 0, 16
        halign = center
        valign = center
      }

      label {
        monitor =
        text = Type to unlock!
        color = $text
        font_size = 16
        font_family = MonaspiceNe Nerd Font 10
        position = 0, 120
        halign = center
        valign = bottom
      }

    '';

}
