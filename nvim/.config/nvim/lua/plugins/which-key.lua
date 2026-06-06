vim.pack.add({ { src = "https://github.com/folke/which-key.nvim", name = "which-key" } })

local config = {
  delay = 0,
  spec = {
    -- { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
    -- { "<leader>d", group = "[D]ocument" },
    -- { "<leader>r", group = "[R]ename" },
    { "<leader>s", group = "[S]earch" },
    -- { "<leader>w", group = "[W]orkspace" },
    -- { "<leader>t", group = "[T]oggle" },
    { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
    { "gr", group = "LSP Actions", mode = { "n" } },
  },
}

require("which-key").setup(config)
