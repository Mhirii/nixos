{ inputs, ... }: {
  imports = [
    ./alacritty.nix
    ./btop.nix
    ./mime.nix
    ./yazi.nix
    ./bash.nix
    ./fish.nix
    ./starship.nix
    ./gtk.nix
    ./hyprland
    (import ./spicetify.nix)
  ];
}
