{ pkgs, ... }: {
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
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
  ];
}
