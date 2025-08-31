-- Global base options and keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Print the line number in front of each line
vim.opt.number = true

-- Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.showmode = false

-- Disable netrw bc own plugin is used
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can
-- increase startup-time.
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    vim.opt.clipboard = "unnamedplus"
  end,
})

-- Keep indentation at line breaks
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep additional sign column on the left
vim.opt.signcolumn = "yes"

-- Perform updates faster
vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

-- Position for new windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show <tab> and trailing spaces
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

-- Highlight the line where the cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.opt.confirm = true

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Clear search highlight in normal
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostick [Q]uickfix list" })
