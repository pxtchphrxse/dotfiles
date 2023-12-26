local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

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

local on_attach = require("plugins.lsp.config.on-attach")
local capabilities = cmp_nvim_lsp.default_capabilities()

local server_options = {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- use mason-lspconfig to setup installed server automatically
-- see ":h mason-lspconfig-automatic-server-setup" for more infomation
local mason_lspconfig_handlers_options = {
  function(server_name) -- default handler
    lspconfig[server_name].setup(server_options)
  end,
  ----------------------
  -- override servers
  ----------------------
  -- for tsserver we use typescript plugin to do the job
  ["tsserver"] = function()
    typescript.setup({ server = server_options })
  end,
}

-- custom servers options in out list
local servers = require("plugins.lsp.config.servers")
for server, option in pairs(servers) do
  local opts = vim.tbl_deep_extend("force", option, server_options)
  mason_lspconfig_handlers_options[server] = function()
    lspconfig[server].setup(opts)
  end
end

mason_lspconfig.setup_handlers(mason_lspconfig_handlers_options)
