#!/bin/bash

# Alacritty config
# $HOME/.config/alacritty/config.sh

# borders
# https://github.com/FelixKratz/JankyBorders
brew tap FelixKratz/formulae
brew install borders

# link
ln -sfn .config/aerospace/.aerospace.toml $HOME/.aerospace.toml
ln -sfn .config/zsh/.zshrc $HOME/.zshrc

ln -sfn .config/git/.gitconfig $HOME/.gitconfig

