{...}: {
  imports =
    [(import ./cli)]
    ++ [(import ./compat/neovim-initlua.nix)]
    ++ [(import ./compat/opencode-tui.nix)]
    # ++ [(import ./compat/vscodium.nix)]
    ++ [(import ./hyprland)]
    ++ [(import ./misc)]
    ++ [(import ./programs)]
    ++ [(import ./rofi)]
    ++ [(import ./shell)]
    ++ [(import ./kdeconnect)]
    # ++ [(import ./hyprpanel)];
    ++ [(import ./waybar)]
    ++ [(import ./noctalia)];
}
