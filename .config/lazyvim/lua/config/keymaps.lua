-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Remove default keymaps
local remove_list = {
  "<leader>xl",
  "<leader>xq",
  -- "<leader>ww",
  -- "<leader>wd",
  -- "<leader>w-",
  -- "<leader>w|",
  -- "<leader>wÞ",
  "<leader>qq",
  -- "<leader>qÞ",
  "<leader>l",
  "]d",
  "[d",
}
for _, lhs in ipairs(remove_list) do
  vim.keymap.del("n", lhs)
end

-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local keymap = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
local keymap_desc = function(mode, lhs, rhs, desc)
  vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend("keep", opts, { desc = desc }))
end

---------------------
-- Insert Mode
---------------------

-- exit insert mode
keymap("i", "jj", "<ESC>")
keymap("i", "jk", "<ESC>")

-- past from last yank
keymap("i", "<C-v>", '<C-r>"')

---------------------
-- Normal Mode
---------------------

keymap_desc("n", "<leader>p", ":Lazy<cr>", "Lazy")

-- save & quit
keymap_desc("n", "<leader>w", ":w!<cr>", "Save")
keymap_desc("n", "<leader>W", ":wa!<cr>", "Save All")
keymap_desc("n", "<leader>q", ":q!<cr>", "Quit")
keymap_desc("n", "<leader>Q", ":qa!<cr>", "Quit All")

-- delete & replace without yank
keymap("n", "x", '"_x')
keymap("n", "X", '"_X')
keymap("n", "d", '"_d')
keymap("n", "D", '"_D')
keymap("n", "c", '"_c')
keymap("n", "C", '"_C')

-- delete with yank
keymap("n", "<leader>d", "d")
keymap("n", "<leader>D", "D")

-- resize window
keymap("n", "<A-Up>", ":resize -4<CR>")
keymap("n", "<A-Down>", ":resize+4<CR>")
keymap("n", "<A-Left>", ":vertical resize -4<CR>")
keymap("n", "<A-Right>", ":vertical resize +4<CR>")

---------------------
-- Visual Mode
---------------------

-- paste, delete, replace without yank
keymap("v", "p", '"_dP')
keymap("v", "x", '"_x')
keymap("v", "X", '"_X')
keymap("v", "d", '"_d')
keymap("v", "D", '"_D')
keymap("v", "c", '"_c')
keymap("v", "C", '"_C')

-- paste & replace with yank
keymap("v", "<leader>p", "p")
-- keymap("v", "<leader>x", "x")
-- keymap("v", "<leader>X", "X")
keymap("v", "<leader>d", "d")
keymap("v", "<leader>D", "D")
keymap("v", "<leader>c", "c")

-- keep cursor in same position when yank
keymap("v", "y", "ygv<ESC>")
