return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "snacks.nvim" },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "lua" })
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							diagnostics = {
								globals = {
									"vim",
								},
							},
						},
					},
				},
			},
		},
	},
}
