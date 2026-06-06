vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" } })

local function custom_on_attach(bufnr)
  local gitsigns = require("gitsigns")

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map("n", "<leader>hpp", gitsigns.preview_hunk, { desc = "[H]unk [P]review" })
  map("n", "<leader>hpi", gitsigns.preview_hunk_inline, { desc = "[H]unk [Preview [I]nline" })
  map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[H]unk [R]eset" })
  map("n", "<leader>hb", gitsigns.blame_line, { desc = "[H]unk [B]lame" })
  map("n", "<leader>hd", gitsigns.diffthis, { desc = "View [H]unk [D]iff" })
  map("n", "]h", gitsigns.next_hunk, { desc = "Go to next [H]unk" })
  map("n", "[h", gitsigns.prev_hunk, { desc = "Go to previous [H]unk" })
end

local config = {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  on_attach = custom_on_attach,
}

require("gitsigns").setup(config)
