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
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = ["hyprland" "gtk"];
    config.common."org.freedesktop.portal.OpenURI" = "gtk";
  };

  environment.systemPackages = with pkgs; [
    hyprpicker
    hyprcursor
    hyprshot
    hyprlock
    hypridle
    hyprpaper
    # swaynotificationcenter
    swappy
    wl-clipboard
    waybar
    rofi
    fuzzel
    nwg-look
    nwg-displays
    libnotify
    qt5.qtwayland
    qt6.qtwayland
    wlogout
  ];
}
