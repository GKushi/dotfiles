vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- optional
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

local config = {
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  filters = {
    git_ignored = false,
  },
}

require("nvim-tree").setup(config)

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "[E]xplore Toggle" })
