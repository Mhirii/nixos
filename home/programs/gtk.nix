{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Fluent-dark";
      package = pkgs.fluent-icon-theme;
    };
  };
}
