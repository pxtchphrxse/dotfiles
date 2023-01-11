-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed
-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */plugins/init.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- use a popup window when packer shows up
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local plugins_list = require("plugins.list")

return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	for _, v in pairs(plugins_list) do
		use(v)
	end

	if packer_bootstrap then
		require("packer").sync()
	end
end)
