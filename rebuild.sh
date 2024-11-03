#!/usr/bin/env bash

pushd ~/flake || exit

if git diff --quiet "*.nix"; then
  echo "No changes to rebuild"
  popd || exit
  exit
fi

alejandra . &>/dev/null ||
  (
    alejandra .
    echo "formatting failed!" && exit 1
  )

git diff -U0 '.*nix'

echo "Nixos Rebuilding"
trap "echo 'Script interrupted'; exit 1" INT
sudo nixos-rebuild switch --flake $HOME/flake#laptop &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"

popd || exit

notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
