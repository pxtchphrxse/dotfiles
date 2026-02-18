return {
	{
		"nvim-mini/mini.trailspace",
		version = "*",
		event = "BufReadPre",
		config = function()
			require("mini.trailspace").setup()
		end,
	},
}
