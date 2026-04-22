local map = function(mode, lhs, rhs, nor, sil)
  if nor == nil then
    nor = true
  end
  if sil == nil then
    sil = true
  end
  vim.keymap.set(mode, lhs, rhs, { noremap = nor, silent = sil })
end

local float_window_config = {
  border = "single",
  max_height = 20,
  max_width = 130,
  close_events = {
    "BufEnter",
    "CursorMoved",
    "ExitPre",
    "ModeChanged",
    "WinEnter",
  },
}
--editor
map("n", "<leader>C", 'gg"*yG')
map("n", "<leader>o", "o<Esc>")
map("n", "<leader>O", "O<Esc>")
map("n", "<leader>m", "ma")
map("n", "<leader>'", "'a")
map("n", "gB", "<C-t>")
map("v", "y", '"*y')
map("n", "E", ":Ex<CR>")
map("n", "<leader>nv", ":vnew<CR>:Ex<CR>")
map("n", "<leader>nh", ":new<CR>:Ex<CR>")
--term
map("t", "<esc>", "<C-\\><C-n>")
map("n", "<leader>tv", ":vnew<CR>:te<CR>")
map("n", "<leader>th", ":new<CR>:te<CR>")
--lsp
map("n", "<C-d>", function()
  vim.diagnostic.open_float(float_window_config)
end)
map("n", "K", function()
  vim.lsp.buf.hover(float_window_config)
end)
-- map("n", "<C-f>", require("conform").format)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
-- Normal Mode: Move current line
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })

-- Insert Mode: Move current line
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down' })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line up' })

-- Visual Mode: Move selection
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })



