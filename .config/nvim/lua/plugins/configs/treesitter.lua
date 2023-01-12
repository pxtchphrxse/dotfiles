-- avoid running in headless mode since it's harder to detect failures
if #vim.api.nvim_list_uis() == 0 then
	return
end

local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter_configs.setup({
	on_config_done = nil,
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"vue",
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {},
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = false,
		disable = { "latex", "help" },
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			-- Languages that have a single comment style
			typescript = "// %s",
			css = "/* %s */",
			scss = "/* %s */",
			html = "<!-- %s -->",
			svelte = "<!-- %s -->",
			vue = "<!-- %s -->",
			json = "",
		},
	},
	indent = { enable = true, disable = { "yaml", "python" } },
	autotag = { enable = true },
	textobjects = {
		swap = {
			enable = false,
			-- swap_next = textobj_swap_keymaps,
		},
		-- move = textobj_move_keymaps,
		select = {
			enable = false,
			-- keymaps = textobj_sel_keymaps,
		},
	},
	textsubjects = {
		enable = false,
		keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
})
