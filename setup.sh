#!/usr/bin/env bash
#
# setup.sh — stow dotfiles from this repository into $HOME (or another target)
#
# Usage:
#   ./setup.sh            # Stow all default modules (x11, bash, git)
#   ./setup.sh git        # Stow only the git module
#   ./setup.sh bash git   # Stow bash and git modules
#
# Unstowing / removing symlinks:
#   To uninstall a module later, use stow -D inside the dotfiles directory.
#   Example:
#     cd ~/dotfiles
#     stow -D bash
#
# Notes:
# - Uses --restow to ensure idempotent symlinking
# - TARGET variable can be modified to stow into a different directory
# - Checks that each module directory exists; missing directories are
#   skipped with a friendly message.
#
# Examples:
#   # Default usage:
#   ./setup.sh
#
#   # Selective stow:
#   ./setup.sh bash git
#
#   # Change target directory:
#   TARGET=$HOME/test ./setup.sh

DOTFILES_DIR="$HOME/dotfiles"
TARGET="$HOME"

# Explicit list of modules to stow
MODULES=(
    x11
    bash
    git
    emacs
    xscreensaver
    # add others here as needed
)

# If arguments are given, use them instead of the default list
if [ $# -gt 0 ]; then
    MODULES=("$@")
fi

for dir in "${MODULES[@]}"; do
    if [ -d "$DOTFILES_DIR/$dir" ]; then
        echo "==> Stowing $dir"
        stow --verbose --target "$TARGET" --restow "$dir"
    else
	echo "!! Skipping $dir (not a directory)"
    fi
done
