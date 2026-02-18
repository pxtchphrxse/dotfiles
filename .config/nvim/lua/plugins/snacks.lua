local dashboard_preset = {
	header = [[
                                                                                       
██████╗ ██╗  ██╗████████╗ ██████╗██╗  ██╗██████╗ ██████╗ ██╗  ██╗███████╗███████╗
██╔══██╗╚██╗██╔╝╚══██╔══╝██╔════╝██║  ██║██╔══██╗██╔══██╗╚██╗██╔╝██╔════╝██╔════╝
██████╔╝ ╚███╔╝    ██║   ██║     ███████║██████╔╝██████╔╝ ╚███╔╝ ███████╗█████╗  
██╔═══╝  ██╔██╗    ██║   ██║     ██╔══██║██╔═══╝ ██╔══██╗ ██╔██╗ ╚════██║██╔══╝  
██║     ██╔╝ ██╗   ██║   ╚██████╗██║  ██║██║     ██║  ██║██╔╝ ██╗███████║███████╗
╚═╝     ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝
                                                                                       
  ]],
	keys = {
		{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
		{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
		{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
		{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
		{
			icon = " ",
			key = "c",
			desc = "Config",
			action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
		},
		{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
		{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
		{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
	},
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = {
			enabled = true,
			preset = dashboard_preset,
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		lazygit = { configure = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		-- buffer
		{
			"<leader>x",
			function()
				Snacks.bufdelete()
			end,
			desc = "Close Buffer",
		},
		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({ hidden = true })
			end,
			desc = "Buffers",
		},
		{
			"<leader>fB",
			function()
				Snacks.picker.buffers({ hidden = true, nofile = true })
			end,
			desc = "Buffers (all)",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Find Files (Root Dir)",
		},
		{
			"<leader>fF",
			function()
				Snacks.picker.files({ filter = { cwd = true } })
			end,
			desc = "Find Files (cwd)",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files({ hidden = true })
			end,
			desc = "Find Files (git-files)",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent({ hidden = true })
			end,
			desc = "Recent",
		},
		{
			"<leader>fR",
			function()
				Snacks.picker.recent({ filter = { cwd = true } })
			end,
			desc = "Recent (cwd)",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Find  Files",
		},
		-- git
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "LazyGit",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (hunks)",
		},
		{
			"<leader>gD",
			function()
				Snacks.picker.git_diff({ base = "origin", group = true })
			end,
			desc = "Git Diff (origin)",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues (open)",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "GitHub Issues (all)",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			"<leader>gP",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},
		-- Grep
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sG",
			function()
				Snacks.picker.grep({ filter = { cwd = true } })
			end,
			desc = "Grep (cwd)",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>sW",
			function()
				Snacks.picker.grep_word({ filter = { cwd = true } })
			end,
			desc = "Visual selection or word (cwd)",
			mode = { "n", "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undotree",
		},
		-- ui
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- explorer
		{
			"<leader>fe",
			function()
				Snacks.explorer({ filter = { cwd = true }, hidden = true })
			end,
			desc = "Explorer (root dir)",
		},
		{
			"<leader>fE",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer (cwd)",
		},
		{ "<leader>e", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
		{ "<leader>E", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
	},
}
