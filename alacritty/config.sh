#!/bin/bash

mkdir -p $HOME/.config/alacritty/themes
git clone https://github.com/dracula/alacritty $HOME/.config/alacritty/themes/dracula
# Alacritty size aliases
alias xs="ln -sf ~/.config/alacritty/xs.toml ~/.config/alacritty/alacritty.toml"
alias s="ln -sf ~/.config/alacritty/s.toml ~/.config/alacritty/alacritty.toml"
alias m="ln -sf ~/.config/alacritty/m.toml ~/.config/alacritty/alacritty.toml"
alias l="ln -sf ~/.config/alacritty/l.toml ~/.config/alacritty/alacritty.toml"
alias xl="ln -sf ~/.config/alacritty/xl.toml ~/.config/alacritty/alacritty.toml"
alias xxl="ln -sf ~/.config/alacritty/xxl.toml ~/.config/alacritty/alacritty.toml"
