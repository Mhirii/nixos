{
  pkgs,
  prefs,
  ...
}: let
  extraPortals =
    if prefs.gnome
    then [pkgs.xdg-desktop-portal-hyprland]
    else [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
in {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = extraPortals;
  };

  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   xdgOpenUsePortal = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-hyprland
  #     pkgs.xdg-desktop-portal-gtk
  #   ];
  # };
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    hyprpicker
    hyprcursor
    hyprshot
    hyprlock
    hypridle
    hyprpaper
    swaynotificationcenter
    swappy
    wl-clipboard
    waybar
    rofi-wayland
    fuzzel
    nwg-look
    nwg-displays
    libnotify
    qt5.qtwayland
    qt6.qtwayland
    wlogout
  ];
}
