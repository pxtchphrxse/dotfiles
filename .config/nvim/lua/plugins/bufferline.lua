return {
	{
		"akinsho/bufferline.nvim",
		branch = "main",
		event = "BufWinEnter",
		dependencies = {
			{ "tiagovla/scope.nvim", config = {} }, -- show only buffers opened in tab
		},
		config = {
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_update_in_inset = false,
				persist_buffer_sort = true,
				sort_by = "id",
				right_mouse_command = ":BD",

				offsets = {
					{
						filetype = "neo-tree",
						text = "NeoTree",
						highlight = "Directory",
					},
				},
			},
		},
	},
	"qpkorr/vim-bufkill", -- close buffer without close window
	"szw/vim-maximizer", -- maximizes and restores current window
}
