#!/usr/bin/env bash

pushd ~/flake || exit

skip=false

for arg in "$@"; do
	if [ "$arg" = "skip" ]; then
		skip=true
	fi
done

if ! [ "$skip" = "true" ] && git diff --quiet "*.nix"; then
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
sudo nixos-rebuild switch --flake $HOME/flake#laptop 2>&1 | tee nixos-switch.log
if [ $? -eq 0 ]; then
	cat nixos-switch.log | grep --color error && exit 1 || rebuild_success=true
fi

if [ "$rebuild_success" = false ]; then
	echo "Nixos rebuild failed"
	exit 1
fi

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"

popd || exit

notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
