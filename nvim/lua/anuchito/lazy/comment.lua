-- https://github.com/numToStr/Comment.nvim/tree/master
return {
    'numToStr/Comment.nvim',
    opts = {
        toggler = {
            line = '<leader>cl', -- Set the toggle line comment mapping
            block = '<leader>cb', -- Optionally set a block comment mapping
        },
        opleader = {
            line = '<leader>cl', -- Set the operator pending line comment mapping
            block = '<leader>cb', -- Optionally set an operator pending block comment mapping
        },
    }
}
