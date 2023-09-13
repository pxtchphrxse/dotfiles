return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag" },
		config = function()
			require("plugins.treesitter.setup")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		config = require("plugins.treesitter.ts-context-config"),
	},
	{ "andymass/vim-matchup", event = "BufRead" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.treesitter.autopairs-setup")
		end,
	},
	{
		"kevinhwang91/nvim-ufo", -- code folding (create fold automatically)
		dependencies = { "kevinhwang91/promise-async" },
		event = "BufRead",
		config = function()
			require("plugins.treesitter.ufo-setup")
		end,
	},
}
