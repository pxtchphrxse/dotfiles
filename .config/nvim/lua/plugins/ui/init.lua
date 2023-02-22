return {
	{
		"folke/noice.nvim", -- plugin that completely replaces the UI for messages, cmdline and the popupmenu
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = {},
	},
	{
		"rcarriga/nvim-notify",
		config = { stages = "fade", timeout = 500 },
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.ui.alpha-setup")
		end,
	},
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			require("plugins.ui.mini-animate-setup")
		end,
	},
}
