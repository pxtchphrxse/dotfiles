local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	code_action_icon = " ",
	code_action_lightbulb = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_icons = {
		def = "  ",
		ref = "  ",
	},
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "rounded",
})
