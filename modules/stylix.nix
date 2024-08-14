{inputs, pkgs, ... }:{
      stylix.base16Scheme = "${pkgs.base16.schemes}/share/themes/ayu-dark.yaml";
      stylix.image = ../home-manager/assets/midnight.png;
      stylix.fonts = {
        monospace = {
          package = pkgs.nerdfonts.override { font = ["JetBrainsMono"];};
          name = "JetBrainsMono Nerd Font Mono";
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
}
