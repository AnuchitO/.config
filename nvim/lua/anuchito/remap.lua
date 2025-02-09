vim.g.mapleader = " "

-- use nvim-tree instead.
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)


-- move selected line up or dow
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor stay still when <Shift-J> to join line
vim.keymap.set("n", "J", "mzJ`z")

-- allow <C-d> and <C-u> half-page jump to keep cursor stay in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- allow cursor stay in the middle duing search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever -- it will keep first copy not replace it when we paste it
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<C-[>")
vim.keymap.set("v", "<C-c>", "<C-[>")
vim.keymap.set("n", "<C-c>", "<C-[>")
vim.keymap.set("x", "<C-c>", "<C-[>")

-- prevent accident quite
vim.keymap.set("n", "Q", "<nop>")

-- create new tmux window with currect path add switch to it
-- vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww -c %:p<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww -c " .. (vim.fn.expand('%:p') ~= '' and vim.fn.expand('%:p:h') or vim.fn.getcwd()) .. "<CR>")


-- open new tmux session but it not work yet.
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "<C-f>", function()
--     vim.fn.system("tmux neww")
-- end)
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- replace a copy text with %s/.../.../gI
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vrm", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/anuchito/remap.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

-- code snippet
-- go
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)


-- no use yet
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
