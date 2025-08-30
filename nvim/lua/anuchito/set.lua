vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set specific settings for JavaScript and TypeScript files
vim.cmd [[
augroup JsTsIndentation
    autocmd!
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact,json,yaml,yml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END
]]


vim.opt.smartindent = true

-- line wrap
vim.opt.wrap = false


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


-- allow treesitter to show more error message and overflow text down the screen
vim.opt.cmdheight = 2


-- Enable LSP
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('cmake')
vim.lsp.enable('cssls')
-- vim.lsp.enable('elixirls')
vim.lsp.enable('eslint')
vim.lsp.enable('gopls')
vim.lsp.enable('html')
vim.lsp.enable('jdtls')
vim.lsp.enable('jsonls')
vim.lsp.enable('kotlin_language_server')
vim.lsp.enable('lua_ls')
vim.lsp.enable('marksman')
vim.lsp.enable('nginx_language_server')
vim.lsp.enable('pyright')
vim.lsp.enable('robotframework_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('sqls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('taplo')
vim.lsp.enable('terraformls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('yamlls')