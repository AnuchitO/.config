-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- LSP Configuration
    { import = "anuchito.lazy.mason" },  -- Mason and LSP servers
    { import = "anuchito.lazy.lsp" },    -- LSP configuration

    -- Other plugins
    { import = "anuchito.lazy.treesitter" },
    { import = "anuchito.lazy.comment" },
    { import = "anuchito.lazy.telescope" },
    { import = "anuchito.lazy.nvim_tree" },
    { import = "anuchito.lazy.undotree" },
    { import = "anuchito.lazy.harpoon" },
    { import = "anuchito.lazy.copilot" },
    { import = "anuchito.lazy.vscode_multi_cur" },
    { import = "anuchito.lazy.colors" },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

