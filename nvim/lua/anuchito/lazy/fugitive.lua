return {
    'tpope/vim-fugitive',
    config = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        local function current_branch()
            return vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("%s+", "") -- Remove any trailing whitespace
        end

        vim.g.fugitive_no_maps = 1 -- Disable default mappings
        vim.keymap.set("n", "<leader>gst", vim.cmd.Git)

        -- always pull rebase with command <leader>ggpur
        vim.keymap.set("n", "<leader>ggpur", function()
            -- pull rebase origin current branch
            local cmd = string.format("Git pull -r origin %s", current_branch())
            vim.cmd(cmd)
        end, { desc = "Git Pull with Rebase" })
        vim.keymap.set("n", "<leader>gp", function()
            -- push origin current branch
            local cmd = string.format("Git push origin %s", current_branch())

            -- Execute the command
            vim.cmd(cmd)
        end, {})

        -- git stash push czz
        vim.keymap.set("n", "<leader>czz", ":Git stash push<CR>", { desc = "Git Stash Push" })
        vim.keymap.set("n", "<leader>czp", ":Git stash pop<CR>", { desc = "Git Stash Pop" })
    end
}
