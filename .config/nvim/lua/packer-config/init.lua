local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */packer-config/init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use({
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("plugins-config.comment").setup()
		end,
	}) -- Easily comment stuff
	use({ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPost" })

	-- logs & notify
	use({ "Tastyep/structlog.nvim" })
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("plugins-config.notify").setup()
		end,
		requires = { "nvim-telescope/telescope.nvim" },
	})

	-- Nvim-Tree Explorer
	use("kyazdani42/nvim-web-devicons")
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins-config.nvimtree").setup()
		end,
	})

	-- Themes
	use("navarasu/onedark.nvim")
	use("lunarvim/colorschemes")
	use("folke/tokyonight.nvim")
	use("artanikin/vim-synthwave84")
	use("olimorris/onedarkpro.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tami5/lspsaga.nvim")
	use("onsails/lspkind-nvim")
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})

	-- cmp snippets (autocomplete)
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
		requires = "hrsh7th/nvim-cmp",
		event = "InsertEnter",
	})
	-- copilot
	-- use("github/copilot.vim")

	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Get extra JSON schemas
	use({ "b0o/SchemaStore.nvim" })

	-- Formater & Linter
	use("jose-elias-alvarez/null-ls.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins-config.telescope").setup()
		end,
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-media-files.nvim")
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("plugins-config.project")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins-config.treesitter").setup()
		end,
	})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("andymass/vim-matchup")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins-config.autopairs").setup()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins-config.gitsigns").setup()
		end,
		event = "BufRead",
	})
	use({ "kdheepak/lazygit.nvim" })

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins-config.lualine").setup()
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins-config.bufferline").setup()
		end,
		branch = "main",
		event = "BufWinEnter",
	})
	use("tpope/vim-fugitive")

	-- Utils
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins-config.whichkey").setup()
		end,
	})
	use({
		"ggandor/lightspeed.nvim",
		config = function()
			require("plugins-config.lightspeed").setup()
		end,
	})

	-- bufferline integration (show only buffers used in tab)
	use({
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	})

	-- alpha
	use({
		"goolord/alpha-nvim",
		config = function()
			require("plugins-config.alpha").setup()
		end,
	})

	-- speed up nvim start time
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("plugins-config.impatient").setup()
		end,
	})

	-- Trouble & Todo
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	})
	-- session manager
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
