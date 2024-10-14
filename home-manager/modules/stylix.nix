{pkgs, ...}: let
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
in {
  stylix.enable = true;
  stylix.image = ../assets/idx.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = monospace;
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["Monaspace"];};
      name = "MonaspaceNe Nerd Font";
      # name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
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
    terminal = 0.2;
    desktop = 1.0;
    popups = 0.9;
  };
  stylix.targets.gnome.enable = false;
}
