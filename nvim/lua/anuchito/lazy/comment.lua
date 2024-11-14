-- https://github.com/numToStr/Comment.nvim/tree/master
return {
    'numToStr/Comment.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'JoosepAlviste/nvim-ts-context-commentstring'
    },
    opts = {
        toggler = {
            line = '<leader>cl',  -- Set the toggle line comment mapping
            block = '<leader>cb', -- Optionally set a block comment mapping
        },
        opleader = {
            line = '<leader>cl',  -- Set the operator pending line comment mapping
            block = '<leader>cb', -- Optionally set an operator pending block comment mapping
        },
        pre_hook = function(ctx)
            -- Use JSX comments if we're in a JavaScript/React file type
            local U = require('Comment.utils')
            local location = nil

            -- Determine if we should use block comments for single-line
            -- or multi-line based on cursor location in visual mode
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
                location = location,
            })
        end,
    }
}
