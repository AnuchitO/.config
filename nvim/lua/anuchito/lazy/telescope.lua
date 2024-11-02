return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope find files only in Git' })
		vim.keymap.set('n', '<leader>ff', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end)
	end
}

