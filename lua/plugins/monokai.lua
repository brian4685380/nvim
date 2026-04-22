vim.pack.add({
  { src = "https://github.com/tanvirtin/monokai.nvim" },
})

local monokai = require("monokai")

monokai.setup({
  palette = monokai.pro, -- optional: pro / classic / soda / octagon
})

vim.cmd.colorscheme("monokai")
