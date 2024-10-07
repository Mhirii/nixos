#!/usr/bin/env bash

isNixos=false

error() {
	echo -e "\033[0;31m$1\033[0m"
}

info() {
	echo -e "\033[0;32m$1\033[0m"
}

if [ -f /etc/NIXOS ]; then
	isNixos=true
fi

if [ ! -d ./home-manager ]; then
	error 'home-manager directory not found,'
	error 'please run this script inside the repo'
	exit 0
fi

info 'Creating symlink'
ln -sfn "$(pwd)"/home-manager "$HOME/.config/home-manager"

git add .

if $isNixos; then
	info 'Rebuilding NixOS'
	sudo nixos-rebuild switch --flake .#laptop
fi

info 'Rebuilding home-manager'
home-manager switch --flake "$HOME/.config/home-manager" -b "backup-$(date +%d-%m_%H-%M)"
