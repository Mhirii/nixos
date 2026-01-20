# Default recipe - show available commands
default:
    @just --list

# Update all flake inputs
update-flake:
    @echo "Updating flake inputs..."
    nix flake update

# Update all home-manager inputs
update-home:
    @echo "Updating home-manager inputs..."
    cd home-manager && nix flake update

# Update everything (both flake and home-manager)
update-all: update-flake update-home
    @echo "All inputs updated successfully!"

# Show flake inputs status
show-flake:
    @echo "Flake inputs:"
    nix flake metadata

# Show home-manager inputs status
show-home:
    @echo "Home-manager inputs:"
    cd home-manager && nix flake metadata

# Show all inputs status
show-all: show-flake show-home

# Update specific flake input
update-flake-input INPUT:
    @echo "Updating flake input: {{INPUT}}"
    nix flake lock --update-input {{INPUT}}

# Update specific home-manager input
update-home-input INPUT:
    @echo "Updating home-manager input: {{INPUT}}"
    cd home-manager && nix flake lock --update-input {{INPUT}}

# Rebuild NixOS using rebuild.sh script
rebuild:
    ./rebuild.sh

# Rebuild NixOS using rebuild.sh with --skip-check
rebuild-force:
    ./rebuild.sh --skip-check

# Rebuild home-manager
rebuild-home:
    @echo "Rebuilding home-manager..."
    cd home-manager && home-manager switch --flake . -b "$(date +backup-%d-%m_%H-%M)"

# Format nix files with alejandra
format:
    @echo "Formatting nix files..."
    alejandra .

# Update flake and rebuild NixOS
update-rebuild: update-flake
    @echo "Flake updated, rebuilding NixOS..."
    ./rebuild.sh --skip-check

# Update home-manager and rebuild
update-rebuild-home: update-home rebuild-home

# Update everything and rebuild both NixOS and home-manager
full-update: update-all
    @echo "Updated all inputs, rebuilding NixOS..."
    ./rebuild.sh --skip-check
    @echo "Rebuilding home-manager..."
    cd home-manager && home-manager switch --flake .
    @echo "Full update complete!"

# Show git diff for nix files
diff:
    git diff -U0 '*.nix'

# List NixOS generations
generations:
    nixos-rebuild list-generations
