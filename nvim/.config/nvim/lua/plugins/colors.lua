vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

require("catppuccin").setup({
  auto_integrations = true,
})

vim.cmd.colorscheme("catppuccin-nvim")

vim.api.nvim_create_user_command("ToggleTheme", function()
  local current_catppuccin = vim.g.colors_name
  if string.find(current_catppuccin, "mocha") then
    vim.cmd.colorscheme("catppuccin-latte")
  else
    vim.cmd.colorscheme("catppuccin-mocha")
  end
end, { desc = "Toggle light/dark theme" })
