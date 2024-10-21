# Feature List

[x] Multi Cursors Edit
    - https://github.com/mg979/vim-visual-multi
[x] File explorer
    - auto focus opening file
    - toggle on and off
[x] Undo
    - undo history even close file and reopen it.
[x] Copilot
    - https://github.com/github/copilot.vim
[ ] Open new project very quickly maybe use Tmux

[ ] LSP
    - https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
## Install Fonts

```sh
family = "JetBrainsMonoNL Nerd Font"
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

quick switch between windows
```
C-b p
```

create new window
```
C-b n
```

## default vim

`<C-w-S-j>` to move panel around
`<C-o>` jump back to previous location
`<C-i>` jump forward to next location

`:map` to list all keybinding
`:map <C-o>` to check keybinding for `<C-o>`

moving back and forward when search inline
`;` to move back
`'` to move forward

`:e!` to reload file

`zz` to center the screen by current line in the middle of screen

`_` to move to the first non-blank character of the line

`$` to move to the end of the line

`0` to move to the beginning of the line

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
`f`               Find File                  |nvim-tree-api.fs.find()|
`F`               Close Find File            |nvim-tree-api.fs.find.close()|

## commment

custom:
`<leader>cl` to comment line
`<leader>cb` to comment block
