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

`<C-w> s` to split panel horizontally
`<C-w> v` to split panel vertically

`<C-w-S-j>` to move panel around
`<C-w> H` to move panel to left
`<C-w> J` to move panel to bottom
`<C-w> K` to move panel to top
`<C-w> L` to move panel to right
`<C-w> o` to close all other panel
`<C-w> =` to resize all panel back orginal balance size
`<C-w> |` to resize panel to full width
`<C-w> _` to resize panel to full height
`<C-w> <` to resize panel to smaller width
`<C-w> >` to resize panel to bigger width
`<C-w> -` to resize panel to smaller height
`<C-w> +` to resize panel to bigger height

`<C-w> r` to rotate panel


`<C-w> h` to  to left panel
`<C-w> j` to  to bottom panel
`<C-w> k` to  to top panel
`<C-w> l` to  to right panel

`<C-w> w` to move to next panel
`<C-w> W` to move to previous panel

`<C-w> t` to move to top panel
`<C-w> b` to move to bottom panel

`<C-w> c` to close panel
`<C-w> o` to close all other panel

`<C-o>` jump back to previous location
`<C-i>` jump forward to next location

`<C-^>` to switch between file

`ct(` to remove all text until `(`
`cT)` to remove all text backward until `)`

`cc` to remove all text in the line and enter insert mode
`I` to enter insert mode at the beginning of the line

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

`[d` to go to diagnostic (go to error) `vim.keymap.set('n', [d', vim.diagnostic.goto_prev, {})`

`]d` to go to diagnostic (go to error) `vim.keymap.set('n', [d', vim.diagnostic.goto_next, {})`

`<C-]>` to go to definition

`g Ctrl-A` to increment number

`b` move to beginning of the curent word

`e` move to end of the current word

`<S-b>` move to beginning after the space

`<S-e>` move to the ending word before space

### visual mode
`U` to convert to uppercase
`u` to convert to lowercase

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

`Y`               Copy Relative Path         |nvim-tree-api.fs.copy.relative_path()|

`gy`              Copy Absolute Path         |nvim-tree-api.fs.copy.absolute_path()|

## commment

custom:

`<leader>cl` to comment line

`<leader>cb` to comment block


## fugitive


`a` git add that file

`P` git add -p all files

`I` (interactive) add patch specific file

`U` restore --staged

`=` toggle show/hide diff (show diff)

`cc` commit with message

`X` discard change

`gq` close fugitive windows

### fugitive: stash

`czw` stash of the work-tree.  Like `czz` with `--keep-index`.

`czz` stash.  Pass a [count] of 1 to add `--include-untracked` or 2 to add `--all`.

`czp` topmost stash, or stash@{count}, preserving the index.

`cz<Space>` command line with ":Git stash ".
