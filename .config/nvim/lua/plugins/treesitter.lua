return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "master",
		init = function()
			-- enable html parser for handlebars files
			vim.cmd("autocmd BufRead,BufNewFile *.hbs set filetype=html")
		end,
		opts = {
			highlight = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
				"vue",
				"sql",
				"dockerfile",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
