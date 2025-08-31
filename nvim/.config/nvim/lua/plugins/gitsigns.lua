return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(mode, key, func, desc)
        vim.keymap.set(mode, key, func, { buffer = bufnr, desc = desc })
      end

      -- Keymaps for GitSigns
      map("n", "<leader>hpp", gs.preview_hunk, "[H]unk [P]review")
      map("n", "<leader>hpi", gs.preview_hunk_inline, "[H]unk [Preview [I]nline")
      map("n", "<leader>hr", gs.reset_hunk, "[H]unk [R]eset")
      map("n", "<leader>hb", gs.blame_line, "[H]unk [B]lame")
      map("n", "<leader>hd", gs.diffthis, "View [H]unk [D]iff")
      map("n", "]h", gs.next_hunk, "Go to next [H]unk")
      map("n", "[h", gs.prev_hunk, "Go to previous [H]unk")
    end,
  },
}
