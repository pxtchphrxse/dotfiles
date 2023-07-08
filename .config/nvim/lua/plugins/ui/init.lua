return {
	{
		"folke/noice.nvim", -- plugin that completely replaces the UI for messages, cmdline and the popupmenu
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufEnter",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.ui.alpha-setup")
		end,
	},
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			require("plugins.ui.mini-animate-setup")
		end,
	},
}
