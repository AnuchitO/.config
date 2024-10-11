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

