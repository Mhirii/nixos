{lib, ...}: {
  programs.vicinae = {
    enable = true;
    systemd = {
      autoStart = true;
      enable = true;
    };
  };
}
