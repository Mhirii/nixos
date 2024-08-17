{ inputs, pkgs, unstable_pkgs, ... }:
{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = (with pkgs; [
    home-manager

    # tools
    vim
    # neovim
    neovide
    tmux
    alacritty
    ueberzugpp # to render images in alacritty
    wezterm
    kitty
    starship
    fish
    git
    lazygit
    delta
    gh
    glab
    docker
    docker-compose
    docker-buildx
    lazydocker
    postman
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
    gum
    btop
    speedtest-rs
    jq
    fastfetch
    pfetch-rs
    sqlite

    # langs
    go
    nodejs_22
    nodePackages.pnpm
    prettierd
    yarn
    bun
    biome
    esbuild
    rustup
    clang
    clang-tools
    cmake
    python3

    # software
    brave
    floorp
    firefox
    betterbird
    bitwarden-desktop
    bitwarden-cli
    discord
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
    smartmontools
    stow
    gtk3
    gtk4
    polkit_gnome

    font-manager

    unstable_pkgs.neovim
  ]);
}
