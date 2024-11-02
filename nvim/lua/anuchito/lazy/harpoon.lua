return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Harpoon requires plenary.nvim
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup()
        -- require("telescope").load_extension('harpoon')

        -- Key mappings
        local map = vim.keymap.set
--        map("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Harpoon menu" })
        map("n", "<leader>a", function() require("harpoon.mark").add_file() end, { desc = "Add file to Harpoon" })
        map("n", "<leader>r", function() require("harpoon.mark").rm_file() end, { desc = "Remove file from Harpoon" })
        map("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end, { desc = "Go to Harpoon file 1" })
        map("n", "<C-t>", function() require("harpoon.ui").nav_file(2) end, { desc = "Go to Harpoon file 2" })
        map("n", "<C-n>", function() require("harpoon.ui").nav_next() end, { desc = "Next Harpoon file" })
        map("n", "<C-p>", function() require("harpoon.ui").nav_prev() end, { desc = "Previous Harpoon file" })

        -- Optional: Toggle previous & next buffers in the Harpoon list
        -- map("n", "<C-S-[>", function() require("harpoon.ui").nav_prev() end, { desc = "Previous Harpoon file" })
        -- map("n", "<C-S-]>", function() require("harpoon.ui").nav_next() end, { desc = "Next Harpoon file" })
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        map("n", "<C-e>", "e: Telescope harpoon marks<CR>", { desc = "Open harpoon window" })
--         map("n", "<C-e>", function() toggle_telescope(harpoon.list()) end, { desc = "Open harpoon window" })
    end,
}
