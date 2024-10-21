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
                dotfiles = false,    -- show dotfiles
                custom = { ".git" }, -- exclude the .git folder
                exclude = { ".local", ".gitignore" },
            },
            -- git = {
            --     enable = true, -- Disable Git status
            -- },
        })

        -- Keymaps for nvim-tree
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

        -- Function to expand all nodes
         -- local function expand_all_nodes()
         --     local api = require("nvim-tree.api")

         --     -- Expand all nodes
         --     api.tree.open()
         --     api.tree.toggle_node()
         --     api.tree.expand_all()
         -- end
         -- vim.keymap.set('n', '<leader>ea', expand_all_nodes, { desc = 'Expand All Nodes in NvimTree' })
        -- Expand all node useing the keymap <leader>ea and nvim-tree.api
        vim.keymap.set('n', '<leader>ea', '<cmd>lua require("nvim-tree.api").open()<CR>', { desc = 'Expand All Nodes in NvimTree' })
        vim.keymap.set("n", "<leader>ea", "<cmd>LspRestart<cr>")
    end,
}






