return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon quick menu" })

    vim.keymap.set("n", "<leader>A", function()
      harpoon:list():add()
    end, { desc = "Harpoon file" })

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end, { desc = "Harpoon to file " .. i })
    end
  end,
}
