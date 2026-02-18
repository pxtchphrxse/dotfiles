return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			{ "tiagovla/scope.nvim", opts = {} }, -- show only buffers opened in tab
			{ "nvim-tree/nvim-web-devicons" },
		},
		keys = function()
			return {
				{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
				{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
				{ "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
				{ "<leader>bl", "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
				{ "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
				{ "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick Close" },
				{ "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move Left" },
				{ "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move Right" },
				{ "<leader>bm", "<cmd>MaximizerToggle<cr>", desc = "Maximize Window" },
				{ "<leader>bt", "<cmd>tabe<cr>", desc = "New Tab" },
				{ "<leader>br", ":BufferLineTabRename ", desc = "Rename Tab" },
				{ "<leader>bx", "<cmd>tabc<cr>", desc = "Close Tab" },
				{ "<tab>", "<cmd>tabnext<cr>", desc = "Next Tab" },
				{ "<S-tab>", "<cmd>tabprev<cr>", desc = "Previous Tab" },
			}
		end,
		opts = {
			highlights = {
				buffer_selected = {
					italic = false,
					fg = "#89ca78",
				},
			},
			options = {
        -- stylua: ignore
        close_command = function(n) Snacks.bufdelete(n) end,
        -- stylua: ignore
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				offsets = {
					{ filetype = "snacks_layout_box" },
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
	"szw/vim-maximizer", -- maximizes and restores current window
}
