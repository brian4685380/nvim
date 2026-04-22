vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = "1.*" },
})

vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip" },
})

local opts = {
  fuzzy = {
    implementation = "lua",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  keymap = {
    preset = "enter",
    ["<Down>"] = {
      function(cmp)
        return cmp.select_next()
      end,
      "snippet_forward",
      "fallback",
    },
    ["<Up>"] = {
      function(cmp)
        return cmp.select_prev()
      end,
      "snippet_backward",
      "fallback",
    },
  },
  completion = {
    documentation = { auto_show = true, window = { border = "single" } },
  },
  snippets = { preset = "luasnip" },
}

require("blink.cmp").setup(opts)
require("luasnip.loaders.from_vscode").lazy_load()
