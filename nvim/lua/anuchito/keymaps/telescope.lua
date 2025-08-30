local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ hidden = true }) end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope find files only in Git' })
vim.keymap.set('n', '<leader>ff', function()
  local success, search_term = pcall(vim.fn.input, "Grep > ")
  if success and search_term and search_term ~= "" then
    builtin.grep_string({ search = search_term })
  end
end, { desc = 'Telescope grep string' })