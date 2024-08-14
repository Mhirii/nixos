{pkgs, ...}:
let
  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "Monaspace"
      "JetBrainsMono"
    ];
  };

  theme = {
    name = "Tokyonight-Dark-B";
    package = pkgs.tokyonight-gtk-theme;
  };
  font = {
    name = "Monaspace";
    package = nerdfonts;
    size = 11;
  };
  cursorTheme = {
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
  };
  iconTheme = {
    name = "Fluent-dark";
    package = pkgs.fluent-icon-theme;
  };
in
{

    gtk = {
      inherit font cursorTheme iconTheme;
      # theme.name = theme.name;
      # enable = true;
      # gtk3.extraCss = ''
      #   headerbar, .titlebar,
      #   .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
      #     border-radius: 0;
      #   }
      # '';
    };
}
