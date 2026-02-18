return {
	{
		"stevearc/conform.nvim",
		cmd = "ConformInfo",
		opts = {
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ async = true })
				end,
				desc = "Format",
			},
			{
				"<leader>lF",
				function()
					require("conform").format({ formatters = { "injected" }, timeout_ms = 3000, async = true })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		init = function()
			-- format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
