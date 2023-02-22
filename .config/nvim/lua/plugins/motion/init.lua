return {
	"tpope/vim-repeat", -- more capability of repeating (improve other plugins & more complex command)
	"tpope/vim-surround", -- add, delete, change surroundings
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	"mg979/vim-visual-multi", -- multiple cursors
	{
		"keaising/im-select.nvim",
		config = {
			default_im_select = "com.apple.keylayout.ABC",
			disable_auto_restore = 1,
		},
	},
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			require("plugins.motion.leap-setup").setup(opts)
		end,
	},
	{
		"ggandor/flit.nvim",
		keys = function()
			---@type LazyKeys[]
			local ret = {}
			for _, key in ipairs({ "f", "F", "t", "T" }) do
				ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
			end
			return ret
		end,
		opts = { labeled_modes = "nx" },
	},
	{ "windwp/nvim-spectre", cmd = "Spectre" },
}
