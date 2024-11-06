{pkgs, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Fluent-dark";
      package = pkgs.fluent-icon-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
