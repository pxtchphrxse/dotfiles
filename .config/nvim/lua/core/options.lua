local opt = vim.opt -- for conciseness

local options = {
	-- tabs & indentation & backspace
	tabstop = 2, -- 2 spaces for tabs (prettier default)
	shiftwidth = 2, -- 2 space for indent width
	expandtab = true, -- exapand tab to spaces
	autoindent = true, -- copy indent from current line when starting new one
	backspace = "indent,eol,start", -- allow backspace on indent, end of line or insert mode start position

	-- line wrapping
	wrap = false, -- disable line wrapping

	-- searching
	ignorecase = true, -- ignore case when searching
	smartcase = true, -- if you include mixed case in your search, assumes you want case-sensitive

	undofile = true, -- enable persistent undo

	---------------------
	-- appearance
	---------------------

	-- line numbers
	relativenumber = true, -- show relative line numbers
	number = true, -- shows absolute line number on cursor line (when relative number is on)
	numberwidth = 2, -- set number column width to 2 {default 4}

	termguicolors = true,
	cursorline = true, -- highlight the current cursor line
	cursorcolumn = false, -- highlight the current column
	background = "dark", -- colorschemes that can be light or dark will be made dark
	signcolumn = "yes", -- show sign column so that text doesn't shift
	-- disable due to noice plugin's warning
	-- lazyredraw = true, -- prevent flickering when use vgv
	mouse = "a", -- allow the mouse to be used inneovim
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	showmode = false, -- turn off things like -- INSERT --
	scrolloff = 2, -- scroll offset
	sidescrolloff = 2, -- horizontal scroll offset

	-- split windows
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window

	-- shell
	shell = "/bin/sh",
}

for k, v in pairs(options) do
	opt[k] = v
end

opt.iskeyword:append("-")
opt.whichwrap:append("<,>,[,],h,l")
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.cmd("syntax enable")
