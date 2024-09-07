{ ... }: {
  services.xserver.desktopManager.gnome.enable = false;
  services.xserver.displayManager.gdm.enable = true;
  services.gnome.core-shell.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
