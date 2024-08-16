let
  browser = "floorp.desktop";
  image = "org.gnome.eog.desktop";
in
{
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
    };
  };
}
