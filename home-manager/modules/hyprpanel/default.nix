{
  lib,
  config,
  ...
}: let
  theme = config.lib.stylix.colors.withHashtag;
in {
  programs.hyprpanel = {
    enable = true;
    settings = {
      bar = {
        customModules.storage.paths = ["/"];
        launcher.icon = "󰣇";
        launcher.autoDetectIcon = true;
        layouts={
	        "0"={
	            left= ["dashboard" "workspaces" "battery" "volume" "systray"];
	            middle= ["media"];
	            right= ["network" "bluetooth" "clock" "notifications"];
    	    };
         "1"={
         			left= ["dashboard" "workspaces" "battery" "volume" "systray"];
	            middle= ["media"];
	            right= ["network" "bluetooth" "clock" "notifications"];
    	    };
         "2"={
      				left= ["dashboard" "workspaces" "battery" "volume" "systray"];
	            middle= ["media"];
	            right= ["network" "bluetooth" "clock" "notifications"];
    	    };
        };
        workspaces = {
          monitorSpecific = false;
          show_numbered = false;
          ignored = "99|98";
          numbered_active_indicator = "underline";
          workspaces = 10;
          show_icons = false;
          showWsIcons = true;
          showApplicationIcons = true;
          workspaceMask = false;
        };
        windowtitle = {
          icon = true;
          label = true;
          custom_title = true;
        };
        autoHide = "never";
      };
      terminal = "$TERMINAL";
      scalingPriority = "gdk";
      menus.volume.raiseMaximumVolume = true;
      theme = lib.mkForce {
        font = {
          name = "MonaspiceNe Nerd Font";
          label = "MonaspiceNe Nerd Font";
          size = "1rem";
        };
        bar = {
          floating = false;
          border.location = "none";
          scaling = 100;
          buttons = {
            enableBorders = false;
            dashboard.enableBorder = false;
            workspaces.enableBorder = false;
          };
          menus.monochrome = true;
          menus.opacity = 100;
        };
        osd = {
          location = "bottom";
          orientation = "horizontal";
          enableShadow = true;
          scaling = 75;
        };

        bar = {
          menus = {
            menu = {
              notifications = {
                background = theme.base00;
                border = theme.base01;
                card = theme.base00;
                clear = theme.base0C;
                label = theme.base0C;
                scrollbar.color = theme.base0C;
                no_notifications_label = theme.base01;

                pager = {
                  background = theme.base00;
                  button = theme.base0C;
                  label = theme.base04;
                };

                switch = {
                  disabled = theme.base01;
                  enabled = theme.base0C;
                  puck = theme.base02;
                  switch_divider = theme.base02;
                };
              };

              media.timestamp = theme.base06;

              network = {
                scroller.color = theme.base0E;
                switch = {
                  disabled = theme.base01;
                  enabled = theme.base0E;
                  puck = theme.base02;
                };
              };

              power = {
                buttons = {
                  sleep = {
                    icon = theme.base01;
                    text = theme.base0C;
                    icon_background = theme.base0C;
                    background = theme.base00;
                  };

                  logout = {
                    icon = theme.base01;
                    text = theme.base0B;
                    icon_background = theme.base0B;
                    background = theme.base00;
                  };

                  restart = {
                    icon = theme.base01;
                    text = theme.base09;
                    icon_background = theme.base09;
                    background = theme.base00;
                  };

                  shutdown = {
                    icon = theme.base01;
                    text = theme.base08;
                    icon_background = theme.base08;
                    background = theme.base00;
                  };
                };

                border.color = theme.base01;
                background.color = theme.base00;
              };

              dashboard = {
                monitors = {
                  disk = {
                    label = theme.base0E;
                    bar = theme.base0E;
                    icon = theme.base0E;
                  };

                  gpu = {
                    label = theme.base0B;
                    bar = theme.base0B;
                    icon = theme.base0B;
                  };

                  ram = {
                    label = theme.base0A;
                    bar = theme.base0A;
                    icon = theme.base0A;
                  };

                  cpu = {
                    label = theme.base08;
                    bar = theme.base08;
                    icon = theme.base08;
                  };

                  bar_background = theme.base02;
                };

                directories = {
                  right = {
                    bottom.color = theme.base0C;
                    middle.color = theme.base0E;
                    top.color = theme.base0D;
                  };

                  left = {
                    bottom.color = theme.base08;
                    middle.color = theme.base0A;
                    top.color = theme.base0E;
                  };
                };

                controls = {
                  input = {
                    text = theme.base01;
                    background = theme.base0E;
                  };

                  volume = {
                    text = theme.base01;
                    background = theme.base08;
                  };

                  notifications = {
                    text = theme.base01;
                    background = theme.base0A;
                  };

                  bluetooth = {
                    text = theme.base01;
                    background = theme.base0C;
                  };

                  wifi = {
                    text = theme.base01;
                    background = theme.base0E;
                  };

                  disabled = theme.base03;
                };

                shortcuts = {
                  recording = theme.base0B;
                  text = theme.base01;
                  background = theme.base0C;
                };

                powermenu = {
                  confirmation = {
                    button_text = theme.base00;
                    deny = theme.base0E;
                    confirm = theme.base0D;
                    body = theme.base06;
                    label = theme.base0C;
                    border = theme.base01;
                    background = theme.base00;
                    card = theme.base00;
                  };

                  sleep = theme.base0C;
                  logout = theme.base0B;
                  restart = theme.base09;
                  shutdown = theme.base08;
                };

                profile.name = theme.base0D;
                border.color = theme.base01;
                background.color = theme.base00;
                card.color = theme.base00;
              };

              clock = {
                weather = {
                  hourly = {
                    temperature = theme.base0E;
                    icon = theme.base0E;
                    time = theme.base0E;
                  };

                  thermometer = {
                    extremelycold = theme.base0C;
                    cold = theme.base0C;
                    moderate = theme.base0C;
                    hot = theme.base09;
                    extremelyhot = theme.base08;
                  };

                  stats = theme.base0E;
                  status = theme.base0D;
                  temperature = theme.base06;
                  icon = theme.base0E;
                };

                calendar = {
                  contextdays = theme.base03;
                  days = theme.base06;
                  currentday = theme.base0E;
                  paginator = theme.base0E;
                  weekdays = theme.base0E;
                  yearmonth = theme.base0D;
                };

                time = {
                  timeperiod = theme.base0D;
                  time = theme.base0E;
                };

                text = theme.base06;
                border.color = theme.base01;
                background.color = theme.base00;
                card.color = theme.base00;
              };

              battery = {
                slider = {
                  puck = theme.base03;
                  backgroundhover = theme.base02;
                  background = theme.base03;
                  primary = theme.base0A;
                };

                icons = {
                  active = theme.base0A;
                  passive = theme.base04;
                };

                listitems = {
                  active = theme.base0A;
                  passive = theme.base06;
                };

                text = theme.base06;
                label.color = theme.base0A;
                border.color = theme.base01;
                background.color = theme.base00;
                card.color = theme.base00;
              };

              systray = {
                dropdownmenu = {
                  divider = theme.base00;
                  text = theme.base06;
                  background = theme.base00;
                };
              };

              bluetooth = {
                iconbutton = {
                  iconbutton.active = theme.base0C;
                  iconbutton.passive = theme.base06;
                };

                icons = {
                  icons.active = theme.base0C;
                  icons.passive = theme.base04;
                };

                listitems = {
                  active = theme.base0C;
                  passive = theme.base06;
                };

                switch = {
                  puck = theme.base02;
                  disabled = theme.base01;
                  enabled = theme.base0C;
                  switch_divider = theme.base02;
                };

                status = theme.base03;
                text = theme.base06;
                label.color = theme.base0C;
                border.color = theme.base01;
                background.color = theme.base00;
                card.color = theme.base00;
                scroller.color = theme.base0C;
              };

              network = {
                iconbuttons = {
                  active = theme.base0E;
                  passive = theme.base06;
                };

                icons = {
                  active = theme.base0E;
                  passive = theme.base04;
                };

                listitems = {
                  active = theme.base0E;
                  passive = theme.base06;
                };

                status.color = theme.base03;
                text = theme.base06;
                label.color = theme.base0E;
                border.color = theme.base01;
                background.color = theme.base00;
                card.color = theme.base00;
              };

              volume = {
                input_slider = {
                  puck = theme.base03;
                  backgroundhover = theme.base02;
                  background = theme.base03;
                  primary = theme.base09;
                };

                audio_slider = {
                  puck = theme.base03;
                  backgroundhover = theme.base02;
                  background = theme.base03;
                  primary = theme.base09;
                };

                icons = {
                  active = theme.base09;
                  passive = theme.base04;
                };

                iconbutton = {
                  active = theme.base09;
                  passive = theme.base06;
                };

                listitems = {
                  active = theme.base09;
                  passive = theme.base06;
                };

                text = theme.base06;
                label.color = theme.base09;
                border.color = theme.base01;
                background.color = theme.base00;
                card.color = theme.base00;
              };

              media = {
                slider = {
                  puck = theme.base03;
                  backgroundhover = theme.base02;
                  background = theme.base03;
                  primary = theme.base0E;
                };

                buttons = {
                  text = theme.base00;
                  background = theme.base0C;
                  enabled = theme.base0D;
                  inactive = theme.base03;
                };

                border.color = theme.base01;
                card.color = theme.base00;
                background.color = theme.base00;
                album = theme.base0E;
                artist = theme.base0D;
                song = theme.base0C;
              };
            };

            background = theme.base00;
            border.color = theme.base01;

            buttons = {
              active = theme.base0E;
              default = theme.base0C;
              disabled = theme.base03;
              text = theme.base01;
            };

            cards = theme.base00;

            check_radio_button = {
              active = theme.base0C;
              background = theme.base01;
            };

            dimtext = theme.base03;

            dropdownmenu = {
              background = theme.base00;
              divider = theme.base00;
              text = theme.base06;
            };

            feinttext = theme.base01;

            iconbuttons = {
              active = theme.base0C;
              passive = theme.base06;
            };

            icons = {
              active = theme.base0C;
              passive = theme.base03;
            };

            label = theme.base0C;

            listitems = {
              active = theme.base0C;
              passive = theme.base06;
            };

            popover = {
              background = theme.base01;
              border = theme.base01;
              text = theme.base0C;
            };

            progressbar = {
              background = theme.base02;
              foreground = theme.base0C;
            };

            slider = {
              background = theme.base03;
              backgroundhover = theme.base02;
              primary = theme.base0C;
              puck = theme.base03;
            };

            switch = {
              disabled = theme.base01;
              enabled = theme.base0C;
              puck = theme.base02;
            };

            text = theme.base06;

            tooltip = {
              background = theme.base00;
              text = theme.base06;
            };
          };

          background = theme.base00;
          border.color = theme.base0C;
          buttons = {
            background = theme.base00;
            borderColor = theme.base0C;
            hover = theme.base02;
            icon = theme.base06;
            icon_background = theme.base00;
            text = theme.base06;

            battery = {
              background = theme.base00;
              border = theme.base06;
              icon = theme.base06;
              icon_background = theme.base06;
              text = theme.base06;
            };

            bluetooth = {
              background = theme.base00;
              border = theme.base0C;
              icon = theme.base0C;
              icon_background = theme.base0C;
              text = theme.base0C;
            };

            clock = {
              background = theme.base00;
              border = theme.base06;
              icon = theme.base06;
              icon_background = theme.base06;
              text = theme.base06;
            };

            dashboard = {
              background = theme.base00;
              border = theme.base0D;
              icon = theme.base0D;
            };

            media = {
              background = theme.base00;
              border = theme.base0B;
              icon = theme.base0B;
              icon_background = theme.base0B;
              text = theme.base0B;
            };

            modules = {
              cava = {
                background = theme.base00;
                border = theme.base0D;
                icon = theme.base0D;
                icon_background = theme.base00;
                text = theme.base0D;
              };
              cpu = {
                background = theme.base00;
                border = theme.base0E;
                icon = theme.base0E;
                icon_background = theme.base00;
                text = theme.base0E;
              };
              hypridle = {
                background = theme.base00;
                border = theme.base0C;
                icon = theme.base0C;
                icon_background = theme.base00;
                text = theme.base0C;
              };
              hyprsunset = {
                background = theme.base00;
                border = theme.base0A;
                icon = theme.base0A;
                icon_background = theme.base00;
                text = theme.base0A;
              };
              kbLayout = {
                background = theme.base00;
                border = theme.base0C;
                icon = theme.base0C;
                icon_background = theme.base00;
                text = theme.base0C;
              };
              microphone = {
                background = theme.base00;
                border = theme.base0B;
                icon = theme.base0B;
                icon_background = theme.base00;
                text = theme.base0B;
              };
              netstat = {
                background = theme.base00;
                border = theme.base0B;
                icon = theme.base0B;
                icon_background = theme.base00;
                text = theme.base0B;
              };
              power = {
                background = theme.base00;
                border = theme.base00;
                icon = theme.base08;
                icon_background = theme.base00;
              };
              ram = {
                background = theme.base00;
                border = theme.base0A;
                icon = theme.base0A;
                icon_background = theme.base00;
                text = theme.base0A;
              };
              storage = {
                background = theme.base00;
                border = theme.base0C;
                icon = theme.base0C;
                icon_background = theme.base00;
                text = theme.base0C;
              };
              submap = {
                background = theme.base00;
                border = theme.base0D;
                icon = theme.base0D;
                icon_background = theme.base00;
                text = theme.base0D;
              };
              updates = {
                background = theme.base00;
                border = theme.base0E;
                icon = theme.base0E;
                icon_background = theme.base00;
                text = theme.base0E;
              };
              weather = {
                background = theme.base00;
                border = theme.base09;
                icon = theme.base09;
                icon_background = theme.base00;
                text = theme.base09;
              };
              worldclock = {
                background = theme.base00;
                border = theme.base0E;
                icon = theme.base0E;
                icon_background = theme.base0E;
                text = theme.base0E;
              };
            };

            network = {
              background = theme.base00;
              border = theme.base0C;
              icon = theme.base0C;
              icon_background = theme.base0C;
              text = theme.base0C;
            };

            notifications = {
              background = theme.base00;
              border = theme.base0D;
              icon = theme.base0D;
              icon_background = theme.base0D;
              total = theme.base0D;
            };

            systray = {
              background = theme.base00;
              border = theme.base02;
              customIcon = theme.base06;
            };

            volume = {
              background = theme.base00;
              border = theme.base07;
              icon = theme.base07;
              icon_background = theme.base07;
              text = theme.base07;
            };

            windowtitle = {
              background = theme.base00;
              border = theme.base06;
              icon = theme.base06;
              icon_background = theme.base06;
              text = theme.base06;
            };

            workspaces = {
              active = theme.base0D;
              available = theme.base04;
              background = theme.base00;
              border = theme.base06;
              hover = theme.base03;
              numbered_active_highlighted_text_color = theme.base00;
              numbered_active_underline_color = theme.base06;
              occupied = theme.base06;
            };
          };
        };

        notification = {
          actions.background = theme.base0D;
          actions.text = theme.base01;
          background = theme.base01;
          border = theme.base01;
          close_button.background = theme.base0D;
          close_button.label = theme.base00;
          label = theme.base0D;
          labelicon = theme.base0D;
          text = theme.base06;
          time = theme.base04;
        };

        osd = {
          icon = theme.base00;
          icon_container = theme.base0D;
          label = theme.base0D;
          theme = {
            color = theme.base0D;
            container = theme.base00;
            empty_color = theme.base01;
            overflow_color = theme.base08;
          };
        };
      };
    };
  };
}
