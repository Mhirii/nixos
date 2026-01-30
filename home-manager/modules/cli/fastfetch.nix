{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        padding = {
          right = 1;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        {
          type = "display";
          key = "Resolution";
        }
        "de"
        "wm"
        "terminal"
        "cpu"
        "Processes"
        "gpu"
        "memory"
        "disk"
        "battery"
        "localIp"
        "break"
        "colors"
      ];
    };
  };
}
