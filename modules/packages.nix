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
    fastfetch
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
    atlas

    # js
    nodejs_22
    nodePackages.pnpm
    prettierd
    biome
    esbuild
    typescript
    sass
    sassc
    # rust
    # rustup
    # cargo
    # c
    clang
    clang-tools
    cmake
    gcc
    lua
    luajit
    # others
    python3
    envoy
    gnumake
    alejandra
    protols
    just
    statix

    # software
    # firefox
    bitwarden-desktop
    bitwarden-cli
    # discord
    # webcord-vencord
    #slack
    # teams-for-linux
    unstable_pkgs.spotify
    # spicetify-cli
    zathura
    mpv
    eog
    vlc
    playerctl
    insomnia
    postman
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

    libreoffice
    # inkscape
    ani-cli

    font-manager
    vscode

    obsidian

    # ncurses

    unstable_pkgs.neovim
    unstable_pkgs.neovide
    unstable_pkgs.zed-editor

    unstable_pkgs.mangayomi

    unstable_pkgs.fish
    unstable_pkgs.bun
    # unstable_pkgs.deno
    unstable_pkgs.docker
    unstable_pkgs.docker-compose
    unstable_pkgs.docker-buildx
    unstable_pkgs.minikube
    unstable_pkgs.kubectl
    # unstable_pkgs.terraform
    unstable_pkgs.kind
    unstable_pkgs.opencode

    # jetbrains
    # unstable_pkgs.jetbrains.goland
    # unstable_pkgs.jetbrains.rust-rover
    # unstable_pkgs.jetbrains-toolbox

    inputs.zen-browser.packages."${system}".default

    unstable_pkgs.rclone

    unstable_pkgs.unciv
  ];
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Monaspace" "JetBrainsMono"];})
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
