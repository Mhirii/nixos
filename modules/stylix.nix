{ inputs, pkgs, ... }: {
  stylix.enable = true;
  stylix.image = ../home-manager/assets/midnight.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = {
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
  #

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "Monaspace" ]; };
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
    terminal = 0.5;
    desktop = 1.0;
    popups = 0.9;
  };
}
