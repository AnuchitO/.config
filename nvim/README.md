# Feature List

[ ] Multi Cursors Edit
[x] File explorer
    - auto focus opening file
    - toggle on and off
[ ] Undo
    - undo history even close file and reopen it.
[ ] Copilot

## Install Fonts

```sh
brew install font-hack-nerd-font
```

## link vim to nvim in homebrew

```sh
 ln -sfn /opt/homebrew/Cellar/neovim/0.10.2_1/bin/nvim /opt/homebrew/bin/vim
```

# Install Packer

https://github.com/wbthomason/packer.nvim

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Create `nvim/lua/anuchito/packer.lua`

```lua
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

end)
```


```vim
PackerSync
```

## Pre-requisites
inorder to use "Grep > " need to install ripgrep
https://github.com/BurntSushi/ripgrep

```
brew install ripgrep
```


## Telescope

```command
<C-p>  move thought list previous (up)
<C-n> move thought list next (down)
```

https://github.com/ThePrimeagen/harpoon



## Delete Packer use Lazy.nvim

## install fzf https://github.com/junegunn/fzf?tab=readme-ov-file#installation
```
brew install fzf
```

## Tmux

go back to previous sesssion
```
C-b S-L
```

## vim

`<C-w-S-j>` to move panel around

## nvim-tree

`<C-v>`           Open: Vertical Split       |nvim-tree-api.node.open.vertical()|
`<C-x>`           Open: Horizontal Split     |nvim-tree-api.node.open.horizontal()
`E`               Expand All                 |nvim-tree-api.tree.expand_all()|
`o`               Open                       |nvim-tree-api.node.open.edit()|
`O`               Open: No Window Picker     |nvim-tree-api.node.open.no_window_picker()|
`p`               Paste                      |nvim-tree-api.fs.paste()|
`P`               Parent Directory           |nvim-tree-api.node.navigate.parent()|
`D`               Trash                      |nvim-tree-api.fs.trash()|
`a`               Create File Or Directory   |nvim-tree-api.fs.create()|

