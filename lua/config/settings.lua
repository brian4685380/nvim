--editor settings
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.rnu = true
vim.o.number = true
vim.o.backspace = "start,eol,indent"
vim.o.splitright = true
vim.o.cul = true
vim.o.mouse = "a"
vim.o.mousemoveevent = true
vim.o.gcr = "n-v-c-sm-i-t:block,ci-ve:ver25,r-cr-o:hor20"
vim.o.undofile = true
vim.o.path = vim.o.path .. "**"
vim.o.wildmenu = true
vim.o.updatetime = 500
--globals
vim.g.tex_flavor = "latex"
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3
vim.o.gcr = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

vim.o.spelllang = "en_us"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("diagnostic_float", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, {
      scope = "cursor",
      focusable = false,
      border = "single",
      source = true,
      close_events = {
        "BufLeave",
        "CursorMoved",
        "InsertEnter",
        "FocusLost",
      },
    })
  end,
})
