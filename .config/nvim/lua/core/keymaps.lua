-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

local keymap = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
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

-- delete & replace without yank
keymap("n", "x", '"_x')
keymap("n", "X", '"_X')
keymap("n", "d", '"_d')
keymap("n", "D", '"_D')
keymap("n", "c", '"_c')
keymap("n", "C", '"_C')

-- delete & replace with yank
keymap("n", "<leader>x", "x")
keymap("n", "<leader>X", "X")
keymap("n", "<leader>d", "d")
keymap("n", "<leader>D", "D")
keymap("n", "<leader>c", "c")
keymap("n", "<leader>C", "C")

-- tab navigation
keymap("n", "<Tab>", ":tabnext<CR>")
keymap("n", "<S-Tab>", ":tabprev<CR>")

-- window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- buffer navigation
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>")
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>")

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>") -- increment
keymap("n", "<leader>-", "<C-x>") -- decrement

-- move line up and down
keymap("n", "<M-j>", ":m .+1<CR>==")
keymap("n", "<M-k>", ":m .-2<CR>==")
keymap("n", "∆", ":m .+1<CR>==") -- if alt+esc don't work in terminal (macOS)
keymap("n", "˚", ":m .-2<CR>==")

-- resize window
keymap("n", "<A-Up>", ":resize -2<CR>")
keymap("n", "<A-Down>", ":resize+2<CR>")
keymap("n", "<A-Left>", ":vertical resize -2<CR>")
keymap("n", "<A-Right>", ":vertical resize +2<CR>")

-- better scroll experience
keymap("n", "<C-f>", "<C-f>zz")
keymap("n", "<C-b>", "<C-b>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

---------------------
-- Visual Mode
---------------------

-- stay in visual mode when indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- move lines up and down
keymap("v", "<M-j>", ":m '>+<CR>gv")
keymap("v", "<M-k>", ":m '<-2<CR>gv")
keymap("v", "∆", ":m '>+<CR>gv") -- if alt+esc don't work in terminal (macOS)
keymap("v", "˚", ":m '<-2<CR>gv")

-- paste & replace without yank
keymap("v", "p", '"_dP')
keymap("v", "x", '"_x')
keymap("v", "X", '"_X')
keymap("v", "d", '"_d')
keymap("v", "D", '"_D')
keymap("v", "c", '"_c')
keymap("v", "C", '"_C')

-- paste & replace with yank
keymap("v", "<leader>p", "p")
keymap("v", "<leader>x", "x")
keymap("v", "<leader>X", "X")
keymap("v", "<leader>d", "d")
keymap("v", "<leader>D", "D")
keymap("v", "<leader>c", "c")
keymap("v", "<leader>C", "C")

-- keep cursor in same position when yank
keymap("v", "y", "ygv<ESC>")

-- better scroll experience
keymap("v", "<C-f>", "<C-f>zz")
keymap("v", "<C-b>", "<C-b>zz")
keymap("v", "<C-d>", "<C-d>zz")
keymap("v", "<C-u>", "<C-u>zz")
