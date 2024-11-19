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

