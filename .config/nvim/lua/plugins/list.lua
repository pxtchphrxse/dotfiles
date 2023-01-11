local plugins_list = {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim

	-- colorschemes
	"navarasu/onedark.nvim",
	"lunarvim/colorschemes",
	"folke/tokyonight.nvim",
	"artanikin/vim-synthwave84",
	"olimorris/onedarkpro.nvim",
	"bluz71/vim-nightfly-guicolors",

	-- git integrations
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
		event = "BufRead",
	},
	"tpope/vim-fugitive",
	"kdheepak/lazygit.nvim",

	-- telescope & extensions
	{
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	"nvim-telescope/telescope-media-files.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("plugins.configs.project")
		end,
	},

	-- treesitter & extensions
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	"nvim-treesitter/nvim-treesitter-context",
	"p00f/nvim-ts-rainbow",
	"windwp/nvim-ts-autotag",
	"andymass/vim-matchup",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.autopairs")
		end,
	},

	-----------------
	-- Autocompletion
	-----------------

	"hrsh7th/nvim-cmp",

	-- sources
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
		requires = "hrsh7th/nvim-cmp",
		event = "InsertEnter",
	},

	-- snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-----------------
	-- LSP
	-----------------

	-- lsp server & null-ls manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- lsp configurer
	"neovim/nvim-lspconfig",
	{ "glepnir/lspsaga.nvim", branch = "main" },
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",

	-- linter & formatter
	"jose-elias-alvarez/null-ls.nvim",

	-- dev icon that many plugins use
	"kyazdani42/nvim-web-devicons",

	-- file explorer
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.configs.nvimtree")
		end,
	},

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.configs.lualine")
		end,
	},

	-- buffers & tabs
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.configs.bufferline")
		end,
		branch = "main",
		event = "BufWinEnter",
	},
	{
		"tiagovla/scope.nvim", -- show only buffers used in tab
		config = function()
			require("scope").setup()
		end,
	},

	-- extra keymappings
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.whichkey")
		end,
	},

	-- essential plugins
	"tpope/vim-repeat", -- more capability of repeating (improve other plugins & more complex command)
	"tpope/vim-surround", -- add, delete, change surroundings
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	"qpkorr/vim-bufkill", -- close buffer without close window
	"szw/vim-maximizer", -- maximizes and restores current window
	{
		"numToStr/Comment.nvim", -- commenting code with gc, gb
		event = "BufRead",
		config = function()
			require("plugins.configs.comment")
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPost" },
	{
		"ggandor/lightspeed.nvim",
		config = function()
			require("plugins.configs.lightspeed")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- dashboard
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.alpha")
		end,
	},

	-- session manager
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},

	-- trouble peek & todo
	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- optimize
	{
		"lewis6991/impatient.nvim", -- speed up nvim start time
		config = function()
			require("plugins.configs.impatient")
		end,
	},

	-- extra JSON schemas
	"b0o/SchemaStore.nvim",
}

return plugins_list
