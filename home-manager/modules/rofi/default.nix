{ pkgs, config, ... }:
let
  base16 = config.stylix.base16Scheme;
in
{
  home = {
    file = {
      ".config/rofi/colors.rasi".text = ''
        * {
          background:       ${base16.base00};
          background-alt:   ${base16.base01}64;
          background-light: ${base16.base02}64;
          bg-transparent:   ${base16.base00}64;
          foreground:       ${base16.base07};
          transparent:      #00000000;
          text:             ${base16.base00};
          foreground:       ${base16.base07};
          selected:         ${base16.base0D};
          active:           ${base16.base03};
          urgent:           ${base16.base08};
          border:           ${base16.base0D};
          border-radius: 8px;
          elm-border-radius: 4px;
          window-width:  640px;
        }
      '';
      ".config/rofi/config.rasi".source = ./config.rasi;
    };
  };
}
