return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			options = {
				disabled_filetypes = { statusline = { "snacks_dashboard" } },
			},
		},
	},
}
