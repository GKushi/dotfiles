local lsp_servers = {
  lua_ls = {},
  clangd = {
    init_options = {
      fallbackFlags = { "-std=c++23" },
    },
  },
  pyright = {},
}

-- Linters, formatters etc.
local tools = {
  stylua = {},
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: [G]oto [D]eclaration" })
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = event.buf, desc = "LSP: [G]oto [D]eclaration" })
  end,
})

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup({})

require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(vim.tbl_extend("keep", lsp_servers, tools)) })

for lsp, config in pairs(lsp_servers) do
  vim.lsp.config(lsp, config)
  vim.lsp.enable(lsp)
end
