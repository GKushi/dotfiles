return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        git_ignored = false, -- disable git ignore filtering
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "[E]xplore Toggle" })
  end,
}
