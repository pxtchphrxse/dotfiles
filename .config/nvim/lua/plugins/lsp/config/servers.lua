local servers = {
	jsonls = require("plugins.lsp.config.settings.jsonls"),
	pyright = require("plugins.lsp.config.settings.pyright"),
	lua_ls = require("plugins.lsp.config.settings.lua_ls"),
	volar = require("plugins.lsp.config.settings.volar"),
	vuels = require("plugins.lsp.config.settings.vuels"),
}

return servers
