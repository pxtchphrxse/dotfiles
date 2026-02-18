return {
	{
		"nvim-mini/mini.jump",
		version = "*",
		event = "BufReadPre",
		config = function()
			require("mini.jump").setup()
		end,
	},
}
