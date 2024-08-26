{ unstable_pkgs, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    package = unstable_pkgs.nushell;
    shellIntegration = {
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    keybindings = {
      "ctrl+shift+u" = "scroll_page_up";
      "ctrl+shift+d" = "scroll_page_down";
    };
    settings = {
      enable_audio_bell = false;
    };
  };
}
