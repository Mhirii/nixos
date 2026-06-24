{
  pkgs,
  lib,
  ...
}: let
  monospace = {
    base00 = "#10151d";
    base01 = "#1f2939";
    base02 = "#333e4f";
    base03 = "#475365";
    base04 = "#8b98a9";
    base05 = "#a4afbd";
    base06 = "#d9dfe7";
    base07 = "#fafbfe";
    base08 = "#fd8da3";
    base09 = "#ffd395";
    base0A = "#ffa23e";
    base0B = "#77d5a3";
    base0C = "#85cdf1";
    base0D = "#92a9ff";
    base0E = "#a87ffb";
    base0F = "#bd9cfe";
  };
  samurai = {
    base00 = "#0b0e14";
    base01 = "#161b29";
    base02 = "#222a3f";
    base03 = "#35405c";
    base04 = "#56688a";
    base05 = "#aebad6";
    base06 = "#d4dff5";
    base07 = "#f0f4ff";
    base08 = "#e06e6e";
    base09 = "#e69c65";
    base0A = "#e3c26b";
    base0B = "#8ccf7e";
    base0C = "#45d9e0";
    base0D = "#759eea";
    base0E = "#9d7cd8";
    base0F = "#8af0e6";
  };
  nasa = {
    base00 = "#0e131b";
    base01 = "#1d2533";
    base02 = "#303b4d";
    base03 = "#455166";
    base04 = "#8b98a9";
    base05 = "#a4afbd";
    base06 = "#d9dfe7";
    base07 = "#fafbfe";
    base08 = "#ef7d93";
    base09 = "#efc48c";
    base0A = "#e6b96a";
    base0B = "#82cca6";
    base0C = "#73A3F3";
    base0D = "#5FC0E3";
    base0E = "#BD60FB";
    base0F = "#FC226B";
  };
  field = {
    base00 = "#0d1117";
    base01 = "#161d27";
    base02 = "#222d3d";
    base03 = "#405368";
    base04 = "#6b849c";
    base05 = "#a5b6c7";
    base06 = "#ccd8e3";
    base07 = "#ebf0f5";
    base08 = "#d16b77";
    base09 = "#d6b054";
    base0A = "#cf8c52";
    base0B = "#68b37e";
    base0C = "#538ecf";
    base0D = "#4cb0b5";
    base0E = "#9a7bc4";
    base0F = "#008eac";
  };
  theme = field;
in {
  stylix.enable = true;
  stylix.enableReleaseChecks = false;
  stylix.image = ../assets/field.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = theme;
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.monaspace;
      name = "MonaspaceNe Nerd Font";
      # name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.geist-font;
      name = "Geist Sans";
    };
    serif = {
      package = pkgs.geist-font;
      name = "Geist Regular";
    };
  };

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 11;
    desktop = 12;
    popups = 12;
  };
  stylix.opacity = {
    applications = 1.0;
    terminal = 0.6;
    desktop = 1.0;
    popups = 0.8;
  };
  stylix.targets.gnome.enable = false;
  stylix.targets.vicinae = {
    enable = true;
    colors.enable = true;
    opacity.enable = true;
  };
  stylix.targets.hyprpanel = {
    enable = false;
  };
  stylix.targets.neovide.enable = false;
}
