local keymap = function(mode, lhs, rhs, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
end

local lsp_keymaps = function(bufnr)
  keymap("n", "gf", "<cmd>Lspsaga finder<CR>", bufnr)
  keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", bufnr)
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", bufnr)
  keymap("n", "go", "<cmd>Lspsaga outline<cr>", bufnr)
  keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", bufnr)
  keymap("n", "K", "<cmd>Lspsaga hover_doc ++quiet<cr>", bufnr)
  -- keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufnr)
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufnr)
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufnr)
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufnr)
  keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", bufnr)
  keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", bufnr)
  keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", bufnr)
  keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", bufnr)
end

local vue3_add_project = function()
  local file = io.open(vim.fn.stdpath("config") .. "/vue3-project.txt", "a+b")
  if not file then
    return
  end
  file:write(vim.fn.getcwd() .. "\n")
  file:close()
end

local config_diagnostic = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local lsp_formatting = function(bufnr, async)
  vim.lsp.buf.format({
    bufnr = bufnr,
    async = async,
  })
end

local augroup = vim.api.nvim_create_augroup("LspServerFormatting", {})

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  config_diagnostic()

  if client.name == "tsserver" then
    keymap("n", "<leader>cr<cr>", "<cmd>TypscriptRenameFile<cr>", bufnr)
  end

  if client.name == "vuels" then
    vim.api.nvim_create_user_command("AddVue3Project", vue3_add_project, { force = true })
  end

  if client.name == "prismals" then
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
      lsp_formatting(bufnr, true)
    end, { force = true })
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

return on_attach
