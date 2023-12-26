return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"jose-elias-alvarez/typescript.nvim",
			{ "folke/neodev.nvim", config = {} },
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("plugins.lsp.config")
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("plugins.lsp.mason")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", name = "nvim-tree-devicons" },
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins.lsp.saga")
		end,
	},
}
