{ ... }: {
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;
  services.gnome.core-shell.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
