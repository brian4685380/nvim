vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.map.on_attach.default(bufnr)

  vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
end

require("nvim-tree").setup({
  on_attach = on_attach,
  view = {
    number = true,
    relativenumber = true,
    width = 34,
    side = "left",
  },
  renderer = {
    group_empty = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
