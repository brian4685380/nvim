vim.pack.add({
  { src = "https://github.com/tanvirtin/monokai.nvim" },
})

local monokai = require("monokai")

monokai.setup({
  palette = monokai.pro, -- optional: pro / classic / soda / octagon
})

vim.cmd.colorscheme("monokai")
vim.api.nvim_set_hl(0, "Visual", {
  bg = "#44475A",
  underline = true,
})
