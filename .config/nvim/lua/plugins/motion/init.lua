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
		"ggandor/lightspeed.nvim",
		config = function()
			require("plugins.motion.lightspeed-setup")
		end,
	},
	{ "windwp/nvim-spectre", cmd = "Spectre" },
}
