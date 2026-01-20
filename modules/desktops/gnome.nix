{prefs, ...}: {
  services.desktopManager.gnome.enable = prefs.gnome;
  services.displayManager.gdm.enable = true;
  services.gnome.core-shell.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
