local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

mason.setup()

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lspconfig_status then
  mason_lspconfig.setup({
    ensure_installed = {
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "jsonls",
      "vuels",
      "volar",
      "bashls",
      "dockerls",
      "prismals",
    },
  })
end

local mason_tool_installer_status, mason_tool_installer = pcall(require, "mason-tool-installer")
if mason_tool_installer_status then
  mason_tool_installer.setup({
    ensure_installed = {
      "prettier",
      "stylua",
      "isort",
      "black",
      "pylint",
      "eslint_d",
      "beautysh",
    },
  })
end
