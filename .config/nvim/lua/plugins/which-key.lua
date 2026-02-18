return {
	{
		"folke/which-key.nvim",
		dependencies = { "nvim-mini/mini.icons", "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			preset = "helix",
			defaults = {},
			spec = {
				{
					mode = { "n", "x" },
					{ "<leader><tab>", group = "tabs" },
					{ "<leader>c", group = "code" },
					{ "<leader>f", group = "file/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>gh", group = "hunks" },
					{ "<leader>s", group = "search" },
					{ "<leader>u", group = "ui" },
					{ "<leader>x", group = "diagnostics/quickfix" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
					{ "z", group = "fold" },
					-- better descriptions
					{ "gx", desc = "Open with system app" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps (which-key)",
			},
			{ "<leader>p", "<cmd>Lazy<cr>", desc = "Lazy" },
			{ "<leader>w", "<cmd>w<cr>", desc = "Save" },
			{ "<leader>W", "<cmd>wa<cr>", desc = "Save All" },
			{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
			{ "<leader>Q", "<cmd>qa<cr>", desc = "Quit All" },
		},
	},
}
