{...}: {
  home.username = "mhiri";
  home.homeDirectory = "/home/mhiri";
  home.stateVersion = "25.11";
  home.packages = [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERM = "xterm-256color";
    TERMINAL = "kitty";
    COLORTERM = "truecolor";
  };

  programs.home-manager.enable = true;

  imports = [
    ./modules
  ];
}
