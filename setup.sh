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

stow --verbose --target "$HOME" -S x11
stow --verbose --target "$HOME" -S shell
stow --verbose --target "$HOME" -S bash
stow --verbose --target "$HOME" -S zsh
stow --verbose --target "$HOME" -S git


