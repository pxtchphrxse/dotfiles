local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	ui = {
		border = "rounded",
	},
	finder = {
		open = "o",
		edit = { "e", "<CR>" },
		vsplit = "v",
		split = "s",
		tabe = "t",
		quit = { "q", "<ESC>" },
	},
	code_action = {
		num_shortcut = false,
		keys = {
			quit = "q",
			exec = "<CR>",
		},
	},
	lightbulb = {
		enable = true,
		enable_on_insert = false,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "o",
			expand_collapse = "u",
			quit = "q",
		},
	},
})
