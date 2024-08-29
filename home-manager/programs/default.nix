{ configs, inputs, ... }: {
  imports = [
    #./alacritty.nix
    ./mime.nix
    ./shell
    ./gtk.nix
    ./hyprland
    ./waybar
    ./rofi
    ./kitty.nix
    (import ./spicetify.nix)
    ./cli
   # ./vscode.nix
  ];
}
