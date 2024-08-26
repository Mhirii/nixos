{ configs, inputs, ... }: {
  imports = [
    ./alacritty.nix
    ./btop.nix
    ./mime.nix
    ./yazi.nix
    ./shell
    ./starship.nix
    ./gtk.nix
    ./hyprland
    ./git.nix
    ./waybar
    ./rofi
    ./tmux.nix
    ./kitty.nix
    (import ./spicetify.nix)
  ];
}
