{
  config,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    tokyonight-gtk-theme
    fluent-icon-theme
    papirus-icon-theme
  ];
}
