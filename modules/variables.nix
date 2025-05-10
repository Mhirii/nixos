{
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    CUDA_CACHE_PATH = "${XDG_CACHE_HOME}/nv";
    GTK2_RC_FILES = "${XDG_CONFIG_HOME}/gtk-2.0/gtkrc";
    RUSTUP_HOME = "${XDG_DATA_HOME}/rustup";
    GOPATH = "${XDG_DATA_HOME}/go";
    GOBIN = "${GOPATH}/bin";
    BUN_INSTALL = "$HOME/.bun";
    PNPM_HOME = "${XDG_DATA_HOME}/pnpm";
    ENCORE_HOME = "${XDG_DATA_HOME}/encore";

    # WGPU_BACKEND = "gl";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
      "${CARGO_HOME}/bin"
      "${BUN_INSTALL}/bin"
      "${GOPATH}"
      "${GOBIN}"
    ];

    EDITOR = "nvim";
    BROWSER = "zen";
    TERM = "xterm-256color";
    TERMINAL = "kitty";
    COLORTERM = "truecolor";
  };
}
