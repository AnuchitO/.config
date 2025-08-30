return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                file_ignore_patterns = { ".git/", "node_modules/" }, -- Ignore these directories by default
            },
            pickers = {
                find_files = {
                    hidden = true, -- Show hidden files, including those in .gitignore
                    no_ignore = false, -- Show files in .gitignore (default: false)
                },
            },
        }
    end
}
