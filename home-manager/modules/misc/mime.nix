let
  browser = "userapp-Zen Browser-EQ48S2.desktop";
  image = "org.gnome.eog.desktop";
  editor = "nvim.desktop";
in {
  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/http" = "${browser}";
      "x-scheme-handler/https" = "${browser}";
      "x-scheme-handler/chrome" = "${browser}";
      "text/html" = "${browser}";
      "application/x-extension-htm" = "${browser}";
      "application/x-extension-html" = "${browser}";
      "application/x-extension-shtml" = "${browser}";
      "application/xhtml+xml" = "${browser}";
      "application/x-extension-xhtml" = "${browser}";
      "application/x-extension-xht" = "${browser}";
      "x-scheme-handler/about" = "${browser}";
      "x-scheme-handler/unknown" = "${browser}";
      "image/png" = "${image}";
      "text/markdown" = "${editor}";
      "text/plain" = "${editor}";
      "image/jpeg" = "${image}";
      "image/gif" = "${browser}";
    };
  };
}
