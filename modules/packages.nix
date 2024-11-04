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
    lazygit
    delta
    gh
    glab
    lazydocker
    #postman
    wget
    curl
    curlie
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

    # go
    go
    air
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-js
    protoc-gen-grpc-web
    grpcurl
    golangci-lint

    # js
    nodejs_22
    nodePackages.pnpm
    prettierd
    yarn
    biome
    esbuild
    typescript
    sass
    sassc
    # rust
    rustup
    # c
    clang
    clang-tools
    cmake
    # others
    python3
    envoy
    gnumake
    alejandra

    # software
    firefox
    bitwarden-desktop
    bitwarden-cli
    # discord
    betterdiscordctl
    webcord-vencord
    element-desktop
    #slack
    spotify
    spicetify-cli
    zathura
    mpv
    gnome.eog
    vlc
    playerctl
    insomnia
    postman

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

    libreoffice
    inkscape
    ani-cli

    font-manager
    telegram-desktop
    vscode
    zed

    obsidian

    unstable_pkgs.neovim
    unstable_pkgs.neovide

    unstable_pkgs.fish
    unstable_pkgs.bun
    unstable_pkgs.deno
    unstable_pkgs.docker
    unstable_pkgs.docker-compose
    unstable_pkgs.docker-buildx

    inputs.zen-browser.packages."${system}".specific
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
