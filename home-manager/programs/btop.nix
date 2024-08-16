{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      truecolor = true;
      vim_keys = false;
      rounded_corners = true;
      shown_boxes = "cpu mem proc";
      proc_sorting = "cpu direct";
    };
  };
}
