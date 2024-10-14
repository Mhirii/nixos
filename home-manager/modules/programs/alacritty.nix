# home.packages = lib.optionals config.programs.alacritty.enable ;
{
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.ueberzugpp # to render images in alacritty
  ];
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

      font = {
        normal = lib.mkForce {
          family = "MonaspiceNe Nerd Font";
          style = "Medium";
        };
        bold = {
          family = "MonaspiceNe Nerd Font";
          style = "Bold";
        };
        size = lib.mkDefault 12;
      };
      # font.normal.family = "MonaspiceNe Nerd Font";

      mouse.hide_when_typing = true;

      window = {
        decorations = "full";
        decorations_theme_variant = "Dark";
        dynamic_padding = false;
        dynamic_title = true;
        title = "Alacritty";
        padding = {
          x = 4;
          y = 4;
        };
      };
    };
  };
}
