return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		build = "cargo build --release",
		dependencies = { "rafamadriz/friendly-snippets" },
		event = "InsertEnter",
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "select_and_accept", "fallback" },
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			cmdline = {
				keymap = {
					preset = "cmdline",
					["<Tab>"] = { "show_and_insert_or_accept_single", "select_next" },
					["<S-Tab>"] = { "show_and_insert_or_accept_single", "select_prev" },
				},
				completion = { menu = { auto_show = false } },
			},
		},
		opts_extend = { "sources.default" },
	},
}
