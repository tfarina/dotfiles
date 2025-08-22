#!/usr/bin/env bash

############################# How to use it #############################
#                                                                       #
# Uncomment the lines of the configs you want to install below.         #
# Then run this script from within the dotfiles directory.              #
# E.g. `cd ~/dotfiles; ./setup.sh`                                      #
#                                                                       #
# To uninstall the config later, run stow -D in the dotfiles directory. #
# E.g. `cd ~/dotfiles; stow -D bash`                                    #
#                                                                       #
#########################################################################

TARGET="$HOME"

# Explicit list of modules to stow
MODULES=(
    x11
    bash
    git
    # add others here as needed
)

# If arguments are given, use them instead of the default list
if [ $# -gt 0 ]; then
    MODULES=("$@")
fi

for dir in "${MODULES[@]}"; do
    echo "==> Stowing $dir"
    stow --verbose --target "$TARGET" --restow "$dir"
done
