local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- search and highlight current
keymap("n", "*", "*N", opts)

-- without yank
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "c", '"_c', opts)
keymap("n", "C", '"_C', opts)

-- with yank
keymap("n", "<leader>x", "x", opts)
keymap("n", "<leader>X", "X", opts)
keymap("n", "<leader>d", "d", opts)
keymap("n", "<leader>D", "D", opts)
keymap("n", "<leader>c", "c", opts)
keymap("n", "<leader>C", "C", opts)

-- Better Tab navigation
keymap("n", "te", ":tabnew<CR>", opts)
keymap("n", "tr", ":LualineRenameTab ", { silent = false, noremap = true })
keymap("n", "<Tab>", ":tabnext<CR>", opts)
keymap("n", "<S-Tab>", ":tabprev<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-n>", ":nohl<CR>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize+2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Move text up and down
keymap("n", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
keymap("i", "jj", "<ESC>", opts) -- Press jj fast to enter
keymap("i", "<C-v>", '<C-r>"', opts) -- paste from last yank

-- Command --
keymap("c", "<C-v>", '<C-r>"', term_opts) -- paste from last yank

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "<M-j>", ":m .+1<CR>==", opts)
keymap("n", "<M-k>", ":m .-2<CR>==", opts)
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)

-- replace without yank
keymap("v", "p", '"_dP', opts)

-- without yank
keymap("v", "x", '"_x', opts)
keymap("v", "X", '"_X', opts)
keymap("v", "d", '"_d', opts)
keymap("v", "D", '"_D', opts)
keymap("v", "c", '"_c', opts)
keymap("v", "C", '"_C', opts)

-- with yank
keymap("v", "<leader>x", "x", opts)
keymap("v", "<leader>X", "X", opts)
keymap("v", "<leader>d", "d", opts)
keymap("v", "<leader>D", "D", opts)
keymap("v", "<leader>c", "c", opts)
keymap("v", "<leader>C", "C", opts)

keymap("v", "y", "ygv<ESC>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
