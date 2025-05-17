return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional for file icons

    config = function()
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Optionally enable 24-bit color
        vim.opt.termguicolors = true

        -- nvim-tree setup
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
                update_root = {
                    enable = true,
                },
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                add_trailing = false,
                root_folder_label = function(path)
                    return "[" .. vim.fn.fnamemodify(path, ":t") .. "]"
                end,
                icons = {
                    show = {
                        file = true,   -- Hide file icons
                        folder_arrow = true,
                        folder = true, -- Hide folder icons
                        git = false,
                    },
                    -- glyphs = {
                    --     default = "",
                    --     symlink = "",
                    --     bookmark = "󰆤",
                    --     modified = "●",
                    --     hidden = "󰜌",
                    --     folder = {
                    --         arrow_closed = "",
                    --         arrow_open = "",
                    --         default = "",
                    --         open = "",
                    --         empty = "",
                    --         empty_open = "",
                    --         symlink = "",
                    --         symlink_open = "",
                    --     },
                    --     git = {
                    --         unstaged = "✗",
                    --         staged = "✓",
                    --         unmerged = "",
                    --         renamed = "➜",
                    --         untracked = "★",
                    --         deleted = "",
                    --         ignored = "◌",
                    --     },
                    -- },
                },
                highlight_opened_files = "all",
                group_empty = true,
            },
            filters = {
                enable = true,
                dotfiles = false,    -- show dotfiles
                git_clean = false, -- Show files ignored by git
                custom = { ".git" }, -- exclude the .git folder
                exclude = { ".local", ".gitignore", ".env" },
            },
            system_open = {
                cmd = "code",
                args = {},
            },
            -- git = {
            --     enable = true, -- Disable Git status
            -- },
        })

        -- Keymaps for nvim-tree
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

        -- mapping <leader>ef to focus on the file in the tree
        vim.keymap.set('n', '<leader>ef', ':NvimTreeFocus<CR>', { desc = 'Focus on file in NvimTree' })
    end,
}
