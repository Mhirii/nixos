{ config
, pkgs
, lib
, ...
}: {
  # home.packages = lib.optionals config.programs.alacritty.enable ;

  programs.alacritty = {
    enable = true;

    settings = {

      live_config_reload = true;
      selection.save_to_clipboard = true;

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
        unfocused_hollow = true;
      };

      # font = {
      #   normal = { family = "MonaspiceNe Nerd Font"; style = "Medium"; };
      #   bold = { family = "MonaspiceNe Nerd Font"; style = "Bold"; };
      #   size = 12;
      # }

      mouse.hide_when_typing = true;

      window = {
        decorations = "full";
        decorations_theme_variant = "Dark";
        dynamic_padding = false;
        dynamic_title = true;
        opacity = lib.mkForce 0.5;
        title = "Alacritty";
        padding = {
          x = 4;
          y = 4;
        };
      };

      # shell = {
      #   program = "/usr/bin/env fish";
      # };
    };
  };
  programs.alacritty.settings.font.normal.family = lib.mkForce "MonaspiceNe Nerd Font";
}
