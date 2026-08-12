vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})

require("nvim-treesitter").setup()
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = {
      ["@function.inner"] = "V",
      ["@function.outer"] = "V",
      ["@class.inner"] = "V",
      ["@class.outer"] = "V",
      ["@loop.inner"] = "V",
      ["@loop.outer"] = "V",
    },
  },
})

local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject

vim.keymap.set({ "x", "o" }, "if", function()
  select_textobject("@function.inner", "textobjects")
end, { desc = "Inside function" })

vim.keymap.set({ "x", "o" }, "af", function()
  select_textobject("@function.outer", "textobjects")
end, { desc = "Around function" })

vim.keymap.set({ "x", "o" }, "ic", function()
  select_textobject("@class.inner", "textobjects")
end, { desc = "Inside class" })

vim.keymap.set({ "x", "o" }, "ac", function()
  select_textobject("@class.outer", "textobjects")
end, { desc = "Around class" })

vim.keymap.set({ "x", "o" }, "il", function()
  select_textobject("@loop.inner", "textobjects")
end, { desc = "Inside loop" })

vim.keymap.set({ "x", "o" }, "al", function()
  select_textobject("@loop.outer", "textobjects")
end, { desc = "Around loop" })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
  desc = "Enable Treesitter highlighting when a parser is available",
})
