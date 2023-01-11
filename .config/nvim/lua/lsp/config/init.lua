local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
	return
end

local on_attach = require("lsp.config.on-attach")
local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = require("lsp.config.servers")

local server_options = {
	on_attach = on_attach,
	capabilities = capabilities,
}

typescript.setup({
	server = server_options,
})

for server, option in pairs(servers) do
	local opts = vim.tbl_deep_extend("force", option, server_options)
	lspconfig[server].setup(opts)
end
