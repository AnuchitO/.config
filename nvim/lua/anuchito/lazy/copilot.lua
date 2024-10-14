return {
    "github/copilot.vim",

    config = function()
        vim.g.copilot_no_tab_map = true  -- Disable default Tab mapping
        vim.api.nvim_set_keymap('i', '<S-Tab>', 'copilot#Accept("<CR>")', { expr = true, silent = true })  -- Accept suggestion
        vim.api.nvim_set_keymap('i', '<S-]>', 'copilot#Next()', { expr = true, silent = true })  -- Next suggestion
        vim.api.nvim_set_keymap('i', '<S-[>', 'copilot#Previous()', { expr = true, silent = true })  -- Previous suggestion
    end,
}







