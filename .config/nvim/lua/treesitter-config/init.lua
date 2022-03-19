local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = "maintained",
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	-- Plugins
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	matchup = {
		enable = true,
		disable = { "c", "ruby" },
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	-- /Plugins
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})

-- folding with syntax
vim.api.nvim_exec(
	[[
  set foldmethod=expr
]],
	true
)
-- set foldexpr=nvim_treesitter#foldexpr()
-- vim.cmd([[
--   autocmd BufReadPost * '<,'>foldopen!
-- ]])
