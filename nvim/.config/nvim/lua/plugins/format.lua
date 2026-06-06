vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local config = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

require("conform").setup(config)

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })
