{ pkgs, ... }:
let
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";

  home-manager = {
    url = "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
    sha256 = "0c83di08nhkzq0cwc3v7aax3x8y5m7qahyzxppinzwxi3r8fnjq3";
  };

  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "Monaspace"
      "JetBrainsMono"
    ];
  };

  # theme = {
  #   name = "Catppuccin-Mocha-Compact-Blue-Dark";
  #   package = pkgs.catppuccin-gtk.override{
  #     accents = [ "blue" ];
  #     size = "compact";
  #     variant = "mocha";
  #   };
  # };
  theme = {
    name = "Tokyonight-Dark-B";
    package = pkgs.tokyonight-gtk-theme;
  };
  font = {
    name = "Monaspace";
    package = nerdfonts;
    size = 11;
  };
  cursorTheme = {
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
  };
  iconTheme = {
    name = "Fluent-dark";
    package = pkgs.fluent-icon-theme;
  };
in
{
  imports = [
    (import "${ fetchTarball(home-manager) }/nixos")
    #(import "${home-manager}/nixos")
  ];

  home-manager.users.mhiri = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "18.09";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */

  gtk = {
    inherit font cursorTheme iconTheme;
    theme.name = theme.name;
    enable = true;
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';
  };

  # home.file.".local/share/flatpak/overrides/global".text = let
  #   dirs = [
  #     "/nix/store:ro"
  #     "xdg-config/gtk-3.0:ro"
  #     "xdg-config/gtk-4.0:ro"
  #     "${config.xdg.dataHome}/icons:ro"
  #   ];
  # in ''
  #     [Context]
  #     filesystems=${builtins.concatStringsSep ";" dirs}
  #   '';
  };
}
