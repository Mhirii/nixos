{ pkgs, ... }:
{
  gtk = {
    iconTheme = {
      name = "Fluent-dark";
      package = pkgs.fluent-icon-theme;
    };
  };
}
