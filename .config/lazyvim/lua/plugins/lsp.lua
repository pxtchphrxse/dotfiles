return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable unused default
      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "gI", false }
      keys[#keys + 1] = { "gy", false }
      keys[#keys + 1] = { "gK", false }
      keys[#keys + 1] = { "<C-k>", false }
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cc", false }
      keys[#keys + 1] = { "<leader>cC", false }

      -- custom keys
      keys[#keys + 1] = { "gf", "<cmd>Lspsaga finder<cr>", desc = "Lsp Finder" }
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to Definition" }
      keys[#keys + 1] = { "gD", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" }
      keys[#keys + 1] = { "go", "<cmd>Lspsaga outline<cr>", desc = "Lsp Outline" }
      keys[#keys + 1] = { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature help" }
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover" }
      keys[#keys + 1] = { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" }
      keys[#keys + 1] = { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Peek References" }
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" }
      keys[#keys + 1] = { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostics" }
      keys[#keys + 1] = { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump Previous" }
      keys[#keys + 1] = { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump Next" }
      keys[#keys + 1] = { "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" }
      keys[#keys + 1] = { "<leader>ld", "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "Document Diagnostics" }
      keys[#keys + 1] = { "<leader>lw", "<cmd>FzfLua lsp_workspace_diagnostics<cr>", desc = "Document Diagnostics" }
      keys[#keys + 1] = { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
      keys[#keys + 1] = { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason" }
      keys[#keys + 1] = { "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" }
      keys[#keys + 1] = { "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous Diagnostic" }
      keys[#keys + 1] = { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "Codelens Action" }
      keys[#keys + 1] = { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" }
      keys[#keys + 1] = { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" }
      keys[#keys + 1] = { "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart Lsp" }
      keys[#keys + 1] = { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga Outline" }
      keys[#keys + 1] = { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols" }
      keys[#keys + 1] = { "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace Symbols" }
      keys[#keys + 1] = { "<leader>ln", "<cmd>ConformInfo<cr>", desc = "Conform Info" }
    end,
    opts = {
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
            workingDirectory = { mode = "auto" },
            format = true,
            rulesCustomizations = {
              { rule = "style/*", severity = "off", fixable = true },
              { rule = "format/*", severity = "off", fixable = true },
              { rule = "*-indent", severity = "off", fixable = true },
              { rule = "*-spacing", severity = "off", fixable = true },
              { rule = "*-spaces", severity = "off", fixable = true },
              { rule = "*-order", severity = "off", fixable = true },
              { rule = "*-dangle", severity = "off", fixable = true },
              { rule = "*-newline", severity = "off", fixable = true },
              { rule = "*quotes", severity = "off", fixable = true },
              { rule = "*semi", severity = "off", fixable = true },
            },
          },
        },
        tailwindcss = {},
        html = {},
        cssls = {},
        bashls = {},
        dockerls = {},
        -- volar = {
        --   init_options = {
        --     typescript = {
        --       tsdk = "/usr/local/lib/node_modules/typescript/lib",
        --     },
        --   },
        -- },
        vuels = {},
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
          },
        },
      },
      setup = {
        -- use volar on vue 3 only otherwise use vuels
        volar = function(_, opts)
          opts.autostart = require("utils.check-vue").isVueVersion3()
        end,
        vuels = function(_, opts)
          opts.autostart = not require("utils.check-vue").isVueVersion3()
        end,
      },
    },
  },
}
