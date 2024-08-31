let
  launch_script = #fish
    ''
      #!/usr/bin/env fish

      if test -z "$argv[1]"
          echo "Please provide an argument"
          exit 1
      end

      set arg $argv[1]

      # defaults
      set terminal $TERMINAL
      set editor $EDITOR


      function isRunning
          set appName $argv[1]
          if pgrep -x $appName >/dev/null
              return 0
          else
              return 1
          end
      end

      function getWorkspaceId
          set appName $argv[1]
          set client (hyprctl clients -j | jq ".[] | select(.initialClass == \"$appName\") | .workspace.id")
          if test -n "$client"
              echo $client
          else
              echo 9 # Return 9 to indicate that the application is not running in any workspace
          end
      end

      switch $arg
          # Hyprland Only
          case firefox
              if isRunning firefox
                  hyprctl dispatch workspace (getWorkspaceId "firefox")
              else
                  firefox
              end

          case browser
              if pgrep zen >/dev/null
                  set browserClient (hyprctl clients -j | jq ".[] | select(.initialClass == \"zen-alpha\") | .workspace.id")
                  if test -n "$browserClient"
                      hyprctl dispatch workspace $browserClient
                  end
              else
                  zen
              end


          case rofi
              rofi -show drun

          case dmenu
              bemenu-run

          case terminal
              $terminal
          case terminal2
              alacritty

          case tmux
              if tmux has
                  $terminal -T tmux -e tmux a &
              else
                  tmux new -d -s Default
                  $terminal -T tmux -e tmux a &
              end

          case nvim
              $terminal -e nvim &
          case neovide
              neovide

          case filesgui
              thunar

          case filestui
              $terminal -e ranger &

          case clipboard
              cliphist list | rofi -dmenu | cliphist decode | wl-copy

          case spotify
              spotify

          case spt
              spotifyd
              $terminal -e spt &
              $terminal -e cava &
      end
    '';
in
{
  home.file = {
    launch = {
      text = launch_script;
      target = ".config/hypr/scripts/launch.fish";
      executable = true;
    };
  };
}
