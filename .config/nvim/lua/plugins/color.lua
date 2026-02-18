return {
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedarkpro").setup({
				options = {
					cursorline = true, -- Use cursorline highlighting?
					transparency = true, -- Use a transparent background?
					terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
					lualine_transparency = false, -- Center bar transparency?
					highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
				},
			})
			vim.cmd([[colorscheme onedark_dark]])
		end,
	},
}
