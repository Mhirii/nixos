let
  volume_script = #fish
    ''
      #!/usr/bin/env fish
      function toggle_mute
          if test (pamixer --get-mute) = true
              if test (ps aux | rg bin/ags | wc -l) -gt 1
                  ags -r 'audio.speaker.is_muted = false; indicator.speaker()'
              end
              pamixer -u
          else if test (pamixer --get-mute) = false
              if test (ps aux | rg bin/ags | wc -l) -gt 1
                  ags -r 'audio.speaker.is_muted = true; indicator.speaker()'
              end
              pamixer -m
          end
      end

      function toggle_mic
          if test (pamixer --default-source --get-mute) = true
              pamixer -u --default-source u
          else if test (pamixer --get-mute) = false
              pamixer --default-source -m
          end
      end

      function inc_volume

          if test (ps aux | rg bin/ags | wc -l) -gt 1
              ags -r 'audio.speaker.volume += 0.05; indicator.speaker()'
          else
              pamixer -i 5
          end
      end

      function dec_volume
          if test (ps aux | rg bin/ags | wc -l) -gt 1
              ags -r 'audio.speaker.volume -= 0.05; indicator.speaker()'
          else
              pamixer -d 5
          end
      end

      function current_volume
          pamixer --get-volume
      end

      if test $argv = mute
          toggle_mute
      else if test $argv = mic
          toggle_mic
      else if test $argv = inc
          inc_volume
      else if test $argv = dec
          dec_volume
      else if test $argv = vol
          current_volume
      else
          echo "mute:   toggle mute"
          echo "mic:    toggle mic"
          echo "inc:    increase volume"
          echo "dec:    decrease volume"
          echo "vol:    current volume"
          if test (ps aux | rg bin/ags | wc -l) -gt 1
              echo yes
          end
      end
    '';
  brightness_script = #bash
    '' 
    #!/usr/bin/env bash
    get_backlight() {
      LIGHT=$(printf "%.0f\n" $(brightnessctl i))
      echo $LIGHT "%"
    }
    notify_user() {
      # notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$icon" "Brightness : $(brightnessctl g)"
    percentage=$(expr $(brightnessctl g) \* 100 / $(brightnessctl m))
    hyprctl notify -1 1000 "rgb(31748F)" $percentage
    }
    inc_backlight() {
      brightnessctl set 5%+ && notify_user
    }
    dec_backlight() {
      brightnessctl set 5%- && notify_user
    }
    if [[ "$1" == "--get" ]]; then
      brightnessctl g
    elif [[ "$1" == "--inc" ]]; then
      inc_backlight
    elif [[ "$1" == "--dec" ]]; then
      dec_backlight
    else
      get_backlight
    fi
  '';
in
{
  home.file = {
    volume = {
      text = volume_script;
      target = ".config/hypr/scripts/volume.fish";
      executable = true;
    };
    brightness = {
      text = brightness_script;
      target = ".config/hypr/scripts/brightness";
      executable = true;
    };
  };
}
