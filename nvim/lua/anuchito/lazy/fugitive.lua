return {
    'tpope/vim-fugitive',
    config = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.g.fugitive_no_maps = 1 -- Disable default mappings
        vim.keymap.set("n", "<leader>gst", vim.cmd.Git)

        -- always pull rebase with command <leader>ggpur
        vim.keymap.set("n", "<leader>ggpur", ":Git pull --rebase<CR>", { desc = "Git Pull with Rebase" })
    end
}
