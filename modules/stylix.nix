{
  inputs,
  pkgs,
  ...
}: let
  midnight = {
    base00 = "#0F1B2E";
    base01 = "#1E3452";
    base02 = "#2E4D70";
    base03 = "#3F6688";
    base04 = "#50809F";
    base05 = "#96D0E9";
    base06 = "#ADDAEB";
    base07 = "#C4E4EE";
    base08 = "#ef6b91";
    base09 = "#f18b74";
    base0A = "#f6d484";
    base0B = "#25da80";
    base0C = "#2ec1dc";
    base0D = "#59a8f8";
    base0E = "#a879e2";
    base0F = "#25dabc";
  };
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
  # stylix.image = ../home-manager/assets/midnight.png;
  stylix.image = ../home/assets/idx.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = monospace;
  #

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
