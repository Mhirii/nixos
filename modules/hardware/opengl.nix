{lib, ...}: {
  hardware = {
    opengl = {
      enable = lib.mkDefault true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
