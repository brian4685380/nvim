return {
  name = "sourcekit",
  ---@type vim.lsp.Config
  config = {
    cmd = { "xcrun", "sourcekit-lsp" },
    filetypes = { "swift" },
    root_markers = {
      "buildServer.json",
      "Package.swift",
      "compile_commands.json",
      ".git",
    },
  },
}
