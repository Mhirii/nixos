{ inputs, pkgs, unstable_pkgs, system, ... }:
{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = (with pkgs; [
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
    docker
    docker-compose
    docker-buildx
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

    # langs
    go
    nodejs_22
    nodePackages.pnpm
    prettierd
    yarn
    biome
    esbuild
    sass
    sassc
    rustup
    clang
    clang-tools
    cmake
    python3

    # software
    #firefox
    chromium
    betterbird
    bitwarden-desktop
    bitwarden-cli
    discord
    #slack
    betterdiscordctl
    spotify
    spicetify-cli
    zathura
    mpv
    gnome.eog
    vlc
    playerctl

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

    font-manager

    unstable_pkgs.neovim
    unstable_pkgs.neovide
    #unstable_pkgs.floorp
    unstable_pkgs.fish
    unstable_pkgs.bun
    inputs.zen-browser.packages."${system}".specific
  ]);
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Monaspace" "JetBrainsMono" ]; })
  ];
}
