return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-tree/nvim-web-devicons", name = "nvim-tree-devicons" },
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				default_component_configs = {
					git_status = {
						symbols = {
							-- Change type
							added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
							modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
							deleted = "✖", -- this can only be used in the git_status source
							renamed = "", -- this can only be used in the git_status source
							-- Status type
							untracked = "",
							ignored = "◌",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
						["W"] = "close_all_nodes",
						["s"] = "open_split",
						["v"] = "open_vsplit",
					},
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = true,
					},
					follow_current_file = true,
				},
			})
		end,
	},
}
