{lib, ...}: {
  hardware = {
    graphics = {
      enable = lib.mkDefault true;
      # driSupport = true;
      # driSupport32Bit = true;
    };
  };
}
