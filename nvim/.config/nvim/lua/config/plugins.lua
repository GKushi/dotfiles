-- For plugins that require building
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "telescope-fzf-native.nvim" then
      local result = vim.system({ "make" }, { cwd = ev.data.path })
      if result.code == 0 then
        vim.notify("Succesfully compiled telescope fzf")
      else
        vim.notify("Failed to compile telescope fzf")
      end
    end

    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

require("../plugins/colors")
require("../plugins/explorer")
require("../plugins/gitsigns")
require("../plugins/which-key")
require("../plugins/status-bar")
require("../plugins/todo")
require("../plugins/telescope")
require("../plugins/harpoon")
require("../plugins/indent")
require("../plugins/lsp")
require("../plugins/format")
require("../plugins/autocompletion")
require("../plugins/treesitter")
require("../plugins/debug")
