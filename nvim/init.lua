require("anuchito")

vim.opt.runtimepath:append('/opt/homebrew/opt/fzf')

-- Create an autocommand group for trimming whitespace
vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })

-- Set up the autocommand to trim trailing whitespace on file save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "TrimWhitespace",
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Create an autocommand group for ensuring a single empty line at EOF
vim.api.nvim_create_augroup("EndOfFileFixer", { clear = true })


-- TODO: fix bug it keep adding empty line
-- Set up the autocommand to adjust empty line at EOF before saving
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = "EndOfFileFixer",
--     pattern = "*",
--     callback = function()
--         local line_count = vim.api.nvim_buf_line_count(0) -- Get the total number of lines
--
--         -- If the buffer is not empty
--         if line_count > 0 then
--             local last_lines = vim.api.nvim_buf_get_lines(0, line_count - 1, line_count, false) -- Get the last line(s)
--
--             -- Remove trailing empty lines
--             while last_lines[#last_lines] == "" do
--                 table.remove(last_lines) -- Remove empty lines
--             end
--
--             -- Ensure one empty line at the end
--             if #last_lines == 0 or last_lines[#last_lines] ~= "" then
--                 vim.api.nvim_buf_set_lines(0, line_count, line_count, false, { "" }) -- Add an empty line
--             end
--         end
--     end,
-- })
