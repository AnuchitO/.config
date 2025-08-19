#!/bin/bash

mkdir -p $HOME/.config/alacritty/themes
git clone https://github.com/dracula/alacritty $HOME/.config/alacritty/themes/dracula
# Alacritty mode aliases
alias awork="alacritty --config-file ~/.config/alacritty/work.toml"
alias apresent="alacritty --config-file ~/.config/alacritty/present.toml"