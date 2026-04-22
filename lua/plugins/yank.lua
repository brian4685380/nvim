vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch", -- highlight color
      timeout = 200,         -- duration in ms
    })
  end,
})
vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set({ "n", "v" }, "p", '"+p')
