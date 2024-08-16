{ inputs, pkgs, ... }: {
  stylix.enable = true;
  stylix.image = ../home-manager/assets/midnight.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = {
    base00 = "#0F1A2D";
    base01 = "#16161E";
    base02 = "#1a2c47";
    base03 = "#263e5f";
    base04 = "#787C99";
    base05 = "#A9B1D6";
    base06 = "#CBCCD1";
    base07 = "#cdd6f4";
    base08 = "#C0CAF5";
    base09 = "#A9B1D6";
    base0A = "#2ec1dc";
    base0B = "#90dc89";
    base0C = "#f18b74";
    base0D = "#59a8f8";
    base0E = "#a879e2";
    base0F = "#ef6b91";
  };

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
