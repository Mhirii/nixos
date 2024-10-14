{
  config,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Monaspace" "JetBrainsMono"];})
  ];

  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    tokyonight-gtk-theme
    fluent-icon-theme
    papirus-icon-theme
  ];
}
