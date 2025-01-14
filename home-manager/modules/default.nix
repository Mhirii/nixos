{...}: {
  imports =
    [(import ./cli)]
    ++ [(import ./hyprland)]
    ++ [(import ./misc)]
    ++ [(import ./programs)]
    ++ [(import ./rofi)]
    ++ [(import ./shell)]
    ++ [(import ./kdeconnect)]
    ++ [(import ./waybar)];
}
