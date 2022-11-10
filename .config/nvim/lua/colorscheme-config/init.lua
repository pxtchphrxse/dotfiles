local colorscheme = "onedarker"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.cmd("hi Search guifg=#abb2bf guibg=#5e81ac")
vim.cmd("hi CursorLine guibg=#282c34")
vim.cmd("hi CursorColumn guibg=#282c34")
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
