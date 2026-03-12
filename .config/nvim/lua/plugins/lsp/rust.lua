return {
	-- rust treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "rust" })
		end,
	},
	-- rustfmt formatter
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
								loadOutDirsFromCheck = true,
								runBuildScripts = true,
							},
							checkOnSave = {
								command = "clippy",
							},
							procMacro = {
								enable = true,
							},
						},
					},
				},
			},
		},
	},
}
