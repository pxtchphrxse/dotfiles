return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"jose-elias-alvarez/typescript.nvim",
			{ "folke/neodev.nvim", config = {} },
			"b0o/SchemaStore.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("plugins.lsp.config")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		config = function()
			require("plugins.lsp.null-ls")
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		dependencies = { "williamboman/mason-lspconfig.nvim", "jayp0521/mason-null-ls.nvim" },
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
