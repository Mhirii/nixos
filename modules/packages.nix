{
  inputs,
  pkgs,
  unstable_pkgs,
  system,
  ...
}: {
  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  environment.systemPackages = with pkgs; [
    home-manager

    # tools
    tmux
    kitty
    starship
    git
    delta
    gh
    glab
    lazygit
    lazydocker
    wget
    curl
    curlie
    dig
    yazi
    pgcli
    eza
    bat
    fzf
    zoxide
    dust
    ripgrep
    fd
    #gum
    btop
    speedtest-rs
    jq
    sqlite
    postgresql
    ytmdl
    zip
    unzip
    warp-terminal

    # go
    unstable_pkgs.go
    unstable_pkgs.graphviz
    unstable_pkgs.delve
    air
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-js
    protoc-gen-grpc-web
    evans
    grpcurl
    golangci-lint

    # js
    nodejs_22
    nodePackages.pnpm
    prettierd
    biome
    esbuild
    typescript
    sass
    sassc
    clang
    clang-tools
    cmake
    gcc
    lua
    luajit
    # others
    python3
    gnumake
    alejandra
    protols
    just
    statix

    # software
    # firefox
    bitwarden-desktop
    bitwarden-cli

    unstable_pkgs.spotify
    # spicetify-cli

    zathura
    mpv
    eog
    vlc
    playerctl
    deluge

    #sys
    cliphist
    brightnessctl
    pamixer
    pavucontrol
    bluez
    bluez-tools
    blueman
    networkmanagerapplet
    xorg.xeyes
    xorg.xhost
    keyd
    #smartmontools
    #stow
    gtk3
    gtk4
    polkit_gnome
    seahorse
    dnsmasq
    openfortivpn
    openfortivpn-webview

    libreoffice
    # inkscape
    ani-cli

    font-manager
    vscode

    obsidian

    # Coding
    unstable_pkgs.neovim
    unstable_pkgs.neovide
    unstable_pkgs.zed-editor
		unstable_pkgs.opencode
		unstable_pkgs.opencode-desktop

    unstable_pkgs.fish
    unstable_pkgs.bun
    unstable_pkgs.docker
    unstable_pkgs.docker-compose
    unstable_pkgs.docker-buildx
    unstable_pkgs.kubectl

    # jetbrains
    # unstable_pkgs.jetbrains.goland
    # unstable_pkgs.jetbrains.rust-rover
    # unstable_pkgs.jetbrains-toolbox

    google-chrome
    inputs.zen-browser.packages."${system}".default

    unstable_pkgs.rclone

    unstable_pkgs.unciv

		# work
    unstable_pkgs.teams-for-linux
    unstable_pkgs.cypress

  ];
  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
    nerd-fonts.jetbrains-mono
    nerd-fonts.space-mono
    google-fonts
  ];

  programs.fish.enable = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.thunar.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [];
}
